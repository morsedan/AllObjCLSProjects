//
//  DANVersionController.m
//  Day1
//
//  Created by morse on 1/3/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DANVersionController.h"
#import "DANVersion.h"

@implementation DANVersionController

- (instancetype)init {
    self = [super init];
    if (self) {
        
//        _versions = [[NSArray alloc] init]; // empty array
        _versions = [[NSArray alloc] initWithObjects:
                     [[DANVersion alloc] initWithName:@"Cheetah" releaseDate:@"March 24, 2001"],
                     [[DANVersion alloc] initWithName:@"Puma" releaseDate:@"September 24, 2001"],
                     [[DANVersion alloc] initWithName:@"Jaguar" releaseDate:@"September 24, 2002"],
                     [[DANVersion alloc] initWithName:@"Panther" releaseDate:@"September 24, 2003"],
                     [[DANVersion alloc] initWithName:@"Tiger" releaseDate:@"September 24, 2005"],
                     [[DANVersion alloc] initWithName:@"Leopard" releaseDate:@"September 24, 2007"],
                     [[DANVersion alloc] initWithName:@"Snow Leopard" releaseDate:@"September 24, 2009"],
                     [[DANVersion alloc] initWithName:@"Lion" releaseDate:@"July 20, 2011"],
                     [[DANVersion alloc] initWithName:@"Mountain Lion" releaseDate:@"September 24, 2012"],
                     [[DANVersion alloc] initWithName:@"Mavericks" releaseDate:@"September 24, 2013"],
                     [[DANVersion alloc] initWithName:@"Yosemite" releaseDate:@"September 16, 2014"],
                     [[DANVersion alloc] initWithName:@"El Capitan" releaseDate:@"September 24, 2015"],
                     [[DANVersion alloc] initWithName:@"Sierra" releaseDate:@"September 24, 2016"],
                     [[DANVersion alloc] initWithName:@"High Sierra" releaseDate:@"September 24, 2017"],
                     [[DANVersion alloc] initWithName:@"Mojave" releaseDate:@"September 24, 2018"],
                     [[DANVersion alloc] initWithName:@"Catalina" releaseDate:@"September 24, 2019?"],
                     nil];
        
    }
    return self;
}





@end
