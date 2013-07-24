//
//  PlayingCardView.h
//  a3
//
//  Created by Ming HU on 24/7/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;

@end
