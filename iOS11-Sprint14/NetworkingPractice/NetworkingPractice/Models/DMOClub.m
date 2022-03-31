//
//  DMOClub.m
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOClub.h"

@implementation DMOClub

- (instancetype)initWithName:(NSString *)name
                        time:(int)time
                       about:(NSString *)about {
    self = [super init];
    if (self) {
        _name = [name copy];
        _time = time;
        _about = [about copy];
    }
    return self;
}

@end
