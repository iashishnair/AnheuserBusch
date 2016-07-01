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

@property (nonatomic, strong) NSNumber *progressAmount;
@property (nonatomic, strong) UIColor *barBackGroundColor;
@property (nonatomic, strong) UIColor *progressColor;

@end
