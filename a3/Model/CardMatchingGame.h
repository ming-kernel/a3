//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ming HU on 26/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readonly) NSString *lastResult;
@property (nonatomic) int matchNumbers;


@end
