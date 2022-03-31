//
//  DMOClubController.h
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMOClub;

@interface DMOClubController : NSObject

@property (readonly, nonatomic) NSArray *savedClubs;
@property (readonly, nonatomic) DMOClub *currentClub;

- (void)loadFromPersistentStore;
- (void)saveClub:(DMOClub *)club;
- (void)removeClub:(DMOClub *)club;
- (void)searchForClubWithName:(NSString *)name completion:(void (^)(DMOClub *club, NSError *error))completion;

@end
