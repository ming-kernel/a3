//
//  Deck.h
//  Matchismo
//
//  Created by Ming HU on 23/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;


@end
