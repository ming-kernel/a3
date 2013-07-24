//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ming HU on 23/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
        
    } else if (otherCards.count == 2) {
      PlayingCard *firstCard = otherCards[0];
      PlayingCard *secondCard = [otherCards lastObject];
      
      if ([self.suit isEqualToString:firstCard.suit] &&
          [self.suit isEqualToString:secondCard.suit]) {
        score = 10;
      } else if (self.rank == firstCard.rank &&
                 self.rank == secondCard.rank) {
        score = 20;
      }
    }
    
    return score;
}

- (NSString *)contents
{
  NSArray *rankStrings = [PlayingCard rankStrings];
  return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
+ (NSArray *)validSuits
{
  return @[@"♥", @"♦", @"♠", @"♣"];
}

+ (NSArray *)rankStrings
{
  return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8",
           @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank { return [self rankStrings].count - 1; }

- (void)setRank:(NSUInteger)rank
{
  if (rank <= [PlayingCard maxRank]) {
    _rank = rank;
  }
}
- (void)setSuit:(NSString *)suit
{
  if ([[PlayingCard validSuits] containsObject:suit]) {
    _suit = suit;
  }
}

- (NSString *)suit
{
  return _suit ? _suit : @"?";
}

@end
