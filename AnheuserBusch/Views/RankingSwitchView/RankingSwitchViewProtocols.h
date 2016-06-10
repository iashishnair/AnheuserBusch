//
//  RankingSwitchViewProtocols.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol RankingSwitchViewDelegate <NSObject>

- (void)clickedLocalRakingButton:(nonnull UIButton *)sender ;
- (void)clickedMarketRankingButton:(nonnull UIButton *)sender ;

@end


@protocol RankingSwitchViewDataSource <NSObject>

@optional
- (nonnull UIColor *)textColor;
- (nonnull UIColor *)colorInHighlightState;

- (nonnull UIFont *)textFontInNormalState;
- (nonnull UIFont *)textFontInHighlightState;

- (nonnull UIColor *)textColorInNormalState;
- (nonnull UIColor *)textColorInHighlightState;
@end