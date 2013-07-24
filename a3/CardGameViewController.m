//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Ming HU on 21/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "CardGameViewController.h"

#import "CardMatchingGame.h"

@interface CardGameViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic) NSInteger flipCount;


@end


@implementation CardGameViewController


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  NSLog(@"numberOfSecitons");
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.cardCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//  NSLog(@"cellForItem");
  
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.collectionViewCellIdentifier forIndexPath:indexPath];
  Card *card = [self.game cardAtIndex:indexPath.item];
  [self updateCell:cell usingCard:card];
  return cell;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
  // abstract
}

- (void)updateUI
{
  
  for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    self.scoreLabel.text = [@"" stringByAppendingFormat:@"Score %d", self.game.score];
  }
  
}

// abstract
- (Deck *)createDeck
{
  return nil; 
}


- (void)switchGameMod
{
  if (self.game.matchNumbers == 2) {
    self.game.matchNumbers = 3;
  } else if (self.game.matchNumbers == 3) {
    self.game.matchNumbers = 2;
  }
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardCount usingDeck:[self createDeck]];
    return _game;
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
  
  CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
  NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
  
  if (indexPath) {
    
    [self.game flipCardAtIndex:indexPath.item];
    NSLog(@"flipAtIndex: %d", indexPath.item);
    Card *card = [self.game cardAtIndex:indexPath.item];
    NSLog(@"cardIsFaceUp: %d", card.isFaceUp);
    [self updateUI];
    self.flipCount++;
    NSLog(@"flipCount: %d", self.flipCount);
  }
  
  
}


- (IBAction)resetGame:(UIButton *)sender
{
  NSLog(@"resetGame");
  self.game = nil;
  [self updateUI];
}




@end
