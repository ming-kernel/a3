//
//  PlayingGameViewController.h
//  Matchismo
//
//  Created by Ming HU on 4/7/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "CardGameViewController.h"

@interface PlayingGameViewController : CardGameViewController

@property NSInteger cardCount;

- (Deck *)createDeck;

@end
