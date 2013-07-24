//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ming HU on 26/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) Deck *deck;
@property (nonatomic) int score;
@property (nonatomic) NSString *lastResult;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
  if (!_cards)
    _cards = [[NSMutableArray alloc] init];
  return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
  self = [self init];
  
  if (self) {
    self.deck = deck;
    for (int i = 0; i < cardCount; i++) {
      Card *card = [deck drawRandomCard];
      if (!card) {
        self = nil;
      } else {
        self.cards[i] = card;
      }
    }
  }
  self.matchNumbers = 2;

  return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
  return (index < self.cards.count) ? self.cards[index] : nil;
}


#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BOUNUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
  Card *currentCard = [self cardAtIndex:index];
  NSMutableArray *otherCards = [[NSMutableArray alloc] init];
  
  if (currentCard.isUnplayable)
    return;
  
  if (currentCard.isFaceUp) {
    currentCard.faceUp = NO;
    return;
  }
    
  // see if flipping this card up creates a match
  self.lastResult = [NSString stringWithFormat:@"Just fliped %@", currentCard.contents];
  
  for (Card *card in self.cards) {
    if (card.isFaceUp && !card.isUnplayable) {
      [otherCards addObject:card];
    }
  }
  
  if (otherCards.count == self.matchNumbers - 1) {
    int matchScore = [currentCard match:otherCards];
    if (matchScore) {
      // set all cards unplayable
      currentCard.unplayable = YES;
      currentCard.faceUp = !currentCard.faceUp;
      for (Card *card in otherCards) {
        card.unplayable = YES;
      }
      self.score += matchScore * MATCH_BOUNUS;
      
      self.lastResult = [NSString stringWithFormat:@"matched %@ and %@",
                         currentCard.contents,
                         ((Card *)otherCards[0]).contents];
      
    } else {
      currentCard.faceUp = YES;
      for (Card *card in otherCards) {
        card.faceUp = NO;
      }
      self.score -= MISMATCH_PENALTY;
    }
  } else {
    currentCard.faceUp = !currentCard.faceUp;
    self.score -= MISMATCH_PENALTY;
  }

}


@end
