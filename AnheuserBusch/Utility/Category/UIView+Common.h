//
//  UIView+Common.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
# define PROFILE_INCENTIVE_TITLE_FONT [UIFont systemFontOfSize:28.0f]


@interface UIView (Common)

@end


@interface UIColor (Common)

+ (UIColor *) defaultPageBGColor;
+ (UIColor *)defaultTextColor;
+ (UIColor *)defaultSeparatorColor;
+ (UIColor *)defaultIncentiveRedColor;
+ (UIColor *)defaultIncentiveGreenColor;
+ (UIColor *)defaultIncentiveOrangeColor;
@end


@interface UIFont (Common)

+ (UIFont *)defaultTextFont;
+ (UIFont *)userRankTextFont;
+ (UIFont *)badgeNumberTextFont;


@end