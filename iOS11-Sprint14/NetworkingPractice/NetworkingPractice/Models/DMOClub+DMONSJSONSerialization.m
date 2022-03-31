//
//  DMOClub+DMONSJSONSerialization.m
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOClub.h"
#import "DMOClub+DMONSJSONSerialization.h"

@implementation DMOClub (DMONSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *about = dictionary[@"strBiographyEN"];
    //        int timeInt = (int) dictionary[@"intFormedYear"];
    NSLog(@"%@", dictionary[@"intFormedYear"]);
    NSString *timeNum = dictionary[@"intFormedYear"];//timeInt;
    if ([timeNum isKindOfClass:[NSString class]] || [timeNum isKindOfClass:[NSNumber class]]) {
        NSLog(@"%@", timeNum);
        int time = [timeNum intValue];
        return [self initWithName: name time:time about:about];
    } else {
        int time = 0;
        return [self initWithName: name time:time about:about];
    }
}

- (NSDictionary *)toDictionary {
    NSNumber *timeNum = [NSNumber numberWithInt:self.time];
//    NSString *name = @"strArtist";
//    NSString *year = @"intFormedYear";
//    NSString *about = @"strBiographyEN";
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : timeNum,
        @"strBiographyEN" : self.about
    };
    
    return dictionary;
}

@end
