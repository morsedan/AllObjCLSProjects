//
//  DMOClub.h
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMOClub : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int time;
@property (nonatomic, copy)NSString *about;

- (instancetype)initWithName:(NSString *)name
                        time:(int)time
                       about:(NSString *)about;

@end
