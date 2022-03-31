//
//  DMOClub+DMONSJSONSerialization.h
//  NetworkingPractice
//
//  Created by morse on 1/23/20.
//  Copyright © 2020 morse. All rights reserved.

@class DMOClub;

@interface DMOClub (DMONSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end
