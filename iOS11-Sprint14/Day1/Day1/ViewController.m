//
//  ViewController.m
//  Day1
//
//  Created by morse on 1/3/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "ViewController.h"
#import "DANVersion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *name = @"DJ"; // Obj-C string
    
    NSLog(@"Hi my name is %@ there are %lu characters in my name", name, (unsigned long)name.length);
    
    char *nameInC = "DJ M"; // C string
    printf("Hi my name is %s\n", nameInC);
    
    printf("Hi my name is %s", name.UTF8String);
    
    float pi = 3.14;
    double distance = 5590;
    int count = 27;
    
    NSLog(@"pi: %0.2f distance: %f count: %i", pi, distance, count);
    
    // 1. Get the space (Buying the land)
    // 2. Initialize the object (Build the house)
    DANVersion *version = [[DANVersion alloc] initWithName:@"Catalina"
                                               releaseDate:@"October 7th, 2019"];
    NSLog(@"Version: %@ releaseDate: %@", version.name, version.releaseDate);
    
}


@end
