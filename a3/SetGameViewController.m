//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Ming HU on 21/4/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCard.h"
#import "SetDeck.h"
#import "CardMatchingGame.h"

@interface SetGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) CardMatchingGame *game;


@end

@implementation SetGameViewController

// IBOutlet set functions
- (void)setCardButtons:(NSArray *)cardButtons
{
  _cardButtons = cardButtons;
  [self updateUI];
}


- (NSAttributedString *)cardToAttributedString:(SetCard *)card
{
  
  UIColor *color = [[UIColor alloc] init];
  if ( [card.color isEqualToString:@"red"] ) {
    color = [UIColor redColor];
  } else if ( [card.color isEqualToString:@"green"] ) {
    color = [UIColor greenColor];
  } else {
    color = [UIColor purpleColor];
  }
  
  NSString *valueString = [[NSString alloc] init];
  for ( int i = 0; i < card.number; i++ ) {
    valueString = [valueString stringByAppendingFormat:@"%@", card.symbol];
  }
  
  UIColor *fillColor = [[UIColor alloc] init];
  if ( [card.shading isEqualToString:@"outline"] ) {
    fillColor = [UIColor clearColor];
  } else if ( [card.shading isEqualToString:@"striped"] ) {
    fillColor = [color colorWithAlphaComponent:0.3];
    
  } else {
    fillColor = color;
  }
  
  
  NSDictionary *attributes = @{ NSForegroundColorAttributeName : fillColor,
                          NSFontAttributeName : [UIFont systemFontOfSize:16.0f],
                          NSStrokeWidthAttributeName : @-5,
                          NSStrokeColorAttributeName : color};
  NSAttributedString *string = [[NSAttributedString alloc] initWithString:valueString attributes:attributes];
  return string;
}

- (void)updateUI
{
  NSLog(@"updateUI");
  for (UIButton *cardButton in self.cardButtons) {
    SetCard *card = (SetCard *)[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
    
    

    [cardButton setAttributedTitle:[self cardToAttributedString:card] forState:UIControlStateNormal];
    
    cardButton.selected = card.isFaceUp;
    cardButton.enabled = !card.isUnplayable;
    
    if (card.isFaceUp) {
      [cardButton setBackgroundColor:[UIColor darkGrayColor]];
    } else {
      [cardButton setBackgroundColor:[UIColor clearColor]];
    }

    if (card.isUnplayable) {
      cardButton.enabled = NO;
      cardButton.alpha = 0;
    }

    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    if (self.game.lastResult) {
      self.resultLabel.text = self.game.lastResult;
    }

  }

}

- (IBAction)resetGame:(UIButton *)sender
{
  NSLog(@"resetGame");
  self.game = nil;
  [self updateUI];
}

- (CardMatchingGame *)game
{
  
  if (!_game) {
    NSLog(@"in game");
    _game = [[CardMatchingGame alloc] initWithCardCount:24 usingDeck:[[SetDeck alloc] init]];
    _game.matchNumbers = 3;
  }
  
  return _game;
}

@end
