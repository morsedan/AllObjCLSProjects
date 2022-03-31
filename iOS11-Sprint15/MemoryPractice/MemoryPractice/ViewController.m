//
//  ViewController.m
//  MemoryPractice
//
//  Created by morse on 1/31/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *quote = @"Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it. - Steve Jobs";
    
    NSCharacterSet *punctuationSet = [NSCharacterSet punctuationCharacterSet];
    
    NSString *cleanQuote = [[quote componentsSeparatedByCharactersInSet:punctuationSet] componentsJoinedByString:@""];
    NSArray *words = [[cleanQuote lowercaseString] componentsSeparatedByString:@" "];
    
    NSMutableDictionary<NSString *, NSNumber *> *wordFrequency = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in words) {
        NSNumber *count = wordFrequency[word];
        if ([count boolValue]) {
            wordFrequency[word] = [NSNumber numberWithInteger:count.integerValue + 1];
        } else {
            wordFrequency[word] = [NSNumber numberWithInt:1];
        }
    }
    
    printf("Word frequency: %s", wordFrequency.description.UTF8String);
    
    [wordFrequency release];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
