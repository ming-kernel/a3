//
//  SetCard.h
//  Matchismo
//
//  Created by Ming HU on 7/4/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic)NSString *symbol;
@property (nonatomic)NSUInteger number;
@property (strong, nonatomic)NSString *color;
@property (strong, nonatomic)NSString *shading;


+ (NSArray *)validSymbol;
+ (NSUInteger)maxNumber;
+ (NSArray *)validColor;
+ (NSArray *)validShading;

@end
