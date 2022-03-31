//
//  DMOClubController.m
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOClubController.h"
#import "DMOClub.h"
#import "DMOClub+DMONSJSONSerialization.h"

@interface DMOClubController() {}

@property (nonatomic) NSMutableArray *internalSavedClubs;

@end

@implementation DMOClubController

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalSavedClubs = [[NSMutableArray alloc] init];
    }
    return self;
}


- (NSArray *)savedClubs {
    return [self.internalSavedClubs copy];
}

- (void)saveClub:(DMOClub *)club {
    NSLog(@"saveClub");
    [self.internalSavedClubs addObject:club];
    [self saveToPersistentStore];
}

- (void)removeClub:(DMOClub *)club {
    [self.internalSavedClubs removeObject:club];
}

- (NSURL *)persistentFileURL {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSURL *baseURL = paths.firstObject;
//    NSURL *url = [baseURL URLByAppendingPathComponent:@"clubs.plist"];

    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"clubs.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
    
    
//    return url;
}

- (void)saveToPersistentStore {
    NSError *saveError = nil;
    NSURL *url = [self persistentFileURL];
    NSMutableArray *clubsArray = [[NSMutableArray alloc] init];
//    NSMutableDictionary *clubsDictionary = [[NSMutableDictionary alloc] init];
    
    for (DMOClub *club in self.internalSavedClubs) {
//        NSUInteger clubIndex = [self.savedClubs indexOfObject:club];
//        NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)clubIndex];
        NSDictionary *clubDict = [club toDictionary];
        [clubsArray addObject:clubDict];
//        [clubsDictionary setValue:clubDict forKey:key];
    }
    NSDictionary *clubsDictionary = @{
        @"artists" : clubsArray
    };
//    NSLog(@"%@", url);
    bool successfulSave = [clubsDictionary writeToURL:url error:nil];
    if (successfulSave) {
        NSLog(@"saved");
        return;
    } else {
        NSLog(@"Error saving clubs: %@", saveError);
    }
}

- (void)loadFromPersistentStore {
    NSURL *url = [self persistentFileURL];
    
    NSDictionary *clubsDictionary = [NSDictionary dictionaryWithContentsOfURL:url];
    
    if (![clubsDictionary[@"artists"]  isEqual: @""]) {
        NSArray *clubDictionaries = clubsDictionary[@"artists"];
//        NSDictionary *clubDictionary = clubDictionaries.firstObject;
        for (NSDictionary *clubDictionary in clubDictionaries) {
            DMOClub *club = [[DMOClub alloc] initWithDictionary:clubDictionary];
            [self.internalSavedClubs addObject:club];
        }
    }
    
    
}


static NSString * const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForClubWithName:(NSString *)name completion:(void (^)(DMOClub *club, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
    [components setQueryItems:@[searchItem]];
    NSURL *url = [components URL];
    
//    NSLog(@"URL: %@", url);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
//        NSLog(@"****JSON: %@", dictionary);
        
        if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *clubDictionaries = dictionary[@"artists"];
            NSDictionary *clubDictionary = clubDictionaries.firstObject;
            DMOClub *club = [[DMOClub alloc] initWithDictionary:clubDictionary];
            
            completion(club, nil);
        }
    }] resume];
    
    
}

@end
