//
//  DANVersion.h
//  Day1
//
//  Created by morse on 1/3/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

// Interface (Class definition)
// Public interface

@interface DANVersion : NSObject
/*
 Obj-C will generate three things for a property
 1. Backing variable (instance variable: _name)     NSString *_name;
 
 2. Getter method
 
 - (NSString *)name;
    return _name;
 
 3. Setter method
 
 - (void)setName:(NSString *)name {
    _name = name;
 }
 */
@property NSString *name;
@property NSString *releaseDate;

// init(name: String, releaseDate: String)
- (instancetype)initWithName:(NSString *)name releaseDate:(NSString *)releaseDate;

// +/- class method(static)/instance method
// (instancetype) = (return type) instancetype means it's returning a DANVersion object

@end
