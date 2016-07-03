//
//  IncentivesProgressBarView.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 29/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  IncentivesProgressBarViewModel;

@interface IncentivesProgressBarView : UIView

@property (strong, nonatomic) IncentivesProgressBarViewModel *incentivesProgressBarViewModel;

@property (strong, nonatomic) NSNumber *minRange;
@property (strong, nonatomic) NSNumber *maxRange;
@property (strong, nonatomic) NSNumber *progressAmount;
@property (strong, nonatomic) NSNumber *progressAmountInPercent;

@property (strong, nonatomic) UIColor *barBackGroundColor;
@property (strong, nonatomic) UIColor *progressColor;

@end
