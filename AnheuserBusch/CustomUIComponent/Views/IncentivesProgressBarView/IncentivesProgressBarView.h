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

@property (nonatomic, strong) IncentivesProgressBarViewModel *incentivesProgressBarViewModel;

@property (nonatomic, strong) NSNumber *minRange;
@property (nonatomic, strong) NSNumber *maxRange;
@property (nonatomic, strong) NSNumber *progressAmount;
@property (nonatomic, strong) NSNumber *progressAmountInPercent;
@property (nonatomic, strong) NSString *unitName;

@property (nonatomic, strong) UIColor *barBackGroundColor;
@property (nonatomic, strong) UIColor *progressColor;

@property (nonatomic, strong) UIColor *unitTextColor;
@property (nonatomic, strong) UIFont *unitTextFont;

- (instancetype)initWithBarType:(NSInteger)type;
@end
