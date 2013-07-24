//
//  PlayingGameViewController.m
//  Matchismo
//
//  Created by Ming HU on 4/7/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "PlayingGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "PlayingCardCollectionViewCell.h"

@interface PlayingGameViewController ()

@end


@implementation PlayingGameViewController


- (Deck *)createDeck
{
  return [[PlayingCardDeck alloc] init];
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
  if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
    PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
    if ([card isKindOfClass:[PlayingCard class]]) {
      PlayingCard *playingCard = (PlayingCard *)card;
      playingCardView.rank = playingCard.rank;
      playingCardView.suit = playingCard.suit;
      playingCardView.faceUp = playingCard.isFaceUp;
      playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
    }
  }
}
- (NSInteger)cardCount
{
  return [PlayingCard validSuits].count * [PlayingCard maxRank];
}

- (NSString *)collectionViewCellIdentifier
{
  return @"PlayingCardCell";
}


@end
