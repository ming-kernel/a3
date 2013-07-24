//
//  SetCard.m
//  Matchismo
//
//  Created by Ming HU on 7/4/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


- (BOOL)matchNumber:(NSArray *)otherCards
{
  int secondNumber = ((SetCard *)otherCards[0]).number;
  int thirdNumber = ((SetCard *)otherCards[1]).number;
  
  if ((self.number == secondNumber) &&
      (self.number == thirdNumber))
    return YES;
  
  if ((self.number != secondNumber) &&
      (self.number != thirdNumber) &&
      (secondNumber != thirdNumber))
    return YES;
  
  
  return NO;
  
    
}

- (BOOL)matchSymbol:(NSArray *)otherCards
{
  NSString *secondSymbol = ((SetCard *)otherCards[0]).symbol;
  NSString *thirdSymbol = ((SetCard *)otherCards[1]).symbol;
  
  if ([self.symbol isEqualToString:secondSymbol] &&
      [self.symbol isEqualToString:thirdSymbol])
    return YES;

  if (![self.symbol isEqualToString:secondSymbol] &&
      ![self.symbol isEqualToString:thirdSymbol] &&
      ![secondSymbol isEqualToString:thirdSymbol])
    return YES;

  return NO;
}

- (BOOL)matchColor:(NSArray *)otherCards
{
  NSString *secondColor = ((SetCard *)otherCards[0]).color;
  NSString *thirdColor = ((SetCard *)otherCards[1]).color;
  
  if ([self.color isEqualToString:secondColor] &&
      [self.color isEqualToString:thirdColor])
    return YES;
  
  if (![self.color isEqualToString:secondColor] &&
      ![self.color isEqualToString:thirdColor] &&
      ![secondColor isEqualToString:thirdColor])
    return YES;
  
  return NO;
}

- (BOOL)matchShading:(NSArray *)otherCards
{
  NSString *secondShading = ((SetCard *)otherCards[0]).shading;
  NSString *thirdShading = ((SetCard *)otherCards[1]).shading;
  
  if ([self.shading isEqualToString:secondShading] &&
      [self.shading isEqualToString:thirdShading])
    return YES;
  
  if (![self.shading isEqualToString:secondShading] &&
      ![self.shading isEqualToString:thirdShading] &&
      ![secondShading isEqualToString:thirdShading])
    return YES;
  
  return NO;
}

- (int)match:(NSArray *)otherCards
{
  if (otherCards.count != 2) {
    return 0;
  }
  
  if (![self matchNumber:otherCards])
    return 0;
  
  if (![self matchSymbol:otherCards])
    return 0;
  
  if (![self matchColor:otherCards])
    return 0;
  
  if (![self matchShading:otherCards])
    return 0;
  
  return 100;
}

- (NSString *)contents
{
  
  return [[NSString alloc] initWithFormat:@"symbol %@ number %d color %@ shading %@", self.symbol, self.number, self.color, self.shading];
//  return @"symbol %@ number %@ color %@ shading %@";
}

+ (NSArray *)validSymbol
{
  return @[@"▲", @"●", @"■"];
}

+ (NSUInteger)maxNumber
{
  return 3;
}

+ (NSArray *)validColor
{
  return @[@"red", @"green", @"purple"];
}

+ (NSArray *)validShading
{
  return @[@"solid", @"stripped", @"open"];
}

// symbol
@synthesize symbol = _symbol;
- (NSString *)symbol
{
  return _symbol ? _symbol : @"?";
}

- (void)setSymbol:(NSString *)symbol
{
  if ([[SetCard validSymbol] containsObject:symbol]) {
    _symbol = symbol;
  }
}

// number
- (void)setNumber:(NSUInteger)number
{
  if (number <= [SetCard maxNumber]) {
    _number = number;
  }
}

// color
@synthesize color = _color;
- (NSString *)color
{
  return _color ? _color : @"?";
}

- (void)setColor:(NSString *)color
{
  if ([[SetCard validColor] containsObject:color]) {
    _color = color;
  }
}

// shading
@synthesize shading = _shading;
- (NSString *)shading
{
  return _shading ? _shading : @"?";
}

- (void)setShading:(NSString *)shading
{
  if ([[SetCard validShading] containsObject:shading]) {
    _shading = shading;
  }
}



@end
