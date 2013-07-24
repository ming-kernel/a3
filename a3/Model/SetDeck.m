//
//  SetDeck.m
//  Matchismo
//
//  Created by Ming HU on 21/4/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

- (id)init
{
  self = [super init];
  
  if (self) {
    for (NSString *symbol in [SetCard validSymbol]) {
      for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
        for (NSString *color in [SetCard validColor]) {
          for (NSString *shading in [SetCard validShading]) {
            SetCard *card = [[SetCard alloc] init];
            card.symbol = symbol;
            card.number = number;
            card.color = color;
            card.shading = shading;
            [self addCard:card atTop:YES];
          }
        }
        
      }
    }
    
  }
  
  return self;
}

@end
