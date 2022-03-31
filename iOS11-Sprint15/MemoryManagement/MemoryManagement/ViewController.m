//
//  ViewController.m
//  MemoryManagement
//
//  Created by morse on 1/28/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // alloc = retain
    NSString *jsonString = [[NSString alloc] initWithFormat:@"{ \"name\" : \"Jake\" }"]; // retainCount = 1
    
    NSString *alias = [jsonString retain]; // retainCount = 2
    
    [alias release]; // retianCount = 1
    alias = nil;
    
    printf("json: %s", jsonString.UTF8String);
    
//    [jsonString dealloc];
//    jsonString = nil;
    [jsonString release];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
