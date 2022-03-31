//
//  DANVersion.m
//  Day1
//
//  Created by morse on 1/3/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DANVersion.h"

// Implementation (Code details)
// Private

@implementation DANVersion

// init(name: String, releaseDate: String) {
//    self.name = name
//    self.releaseDate = releaseDate
// }

- (instancetype)initWithName:(NSString *)name releaseDate:(NSString *)releaseDate {
    self = [super init];
    // if self != nil {} Swift
    if (self) {
        // Setup the object
        
        // self.name = name has Side effects in Obj-C (property setter)
        _name = name;
        _releaseDate = releaseDate;
    }
    return self;
}


@end
