//
//  Pokemon.h
//  ConcurrencyPractice
//
//  Created by morse on 1/28/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMOPokemon : NSObject

@property (nonatomic, copy, nonnull) NSString *name; //  "name": "bulbasaur"
@property (nonatomic, nullable) NSURL *infoURL;
@property (nonatomic) int idenitifier; // "id": 1
@property (nonatomic, copy, nullable) NSString *abilities; // see below
@property (nonatomic, copy, nullable) NSURL *sprite; // see below

- (nonnull instancetype)initWithName:(nonnull NSString *)name
                             infoURL:(nullable NSURL *)infoURL
                          identifier:(int)identifier
                           abilities:(nullable NSString *)abilities
                              sprite:(nullable NSURL *)sprite;
- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

/*
 "abilities":
 [
     {"ability":{"name":"chlorophyll","url":"https://pokeapi.co/api/v2/ability/34/"},"is_hidden":true,"slot":3},
     {"ability":{"name":"overgrow","url":"https://pokeapi.co/api/v2/ability/65/"},"is_hidden":false,"slot":1}
 ]
 */

/*
 "sprites":
 {
     "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
     "back_female": null,
     "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
     "back_shiny_female": null,
     "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
     "front_female": null,
     "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
     "front_shiny_female": null
 }
 */
