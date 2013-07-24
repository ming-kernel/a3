//
//  Card.m
//  Matchismo
//
//  Created by Ming HU on 21/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
  int score = 0;
  
  for (Card *card in otherCards) {
    if ([card.contents isEqualToString:self.contents]) {
      score = 1;
    }
  }
  return score;
}

@end
