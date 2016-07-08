//
//  UIView+Common.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
# define PROFILE_INCENTIVE_TABLE_HEADING_FONT_SIZE [UIFont systemFontOfSize:17.0f]
# define PROFILE_USER_NAME_FONT_SIZE [UIFont systemFontOfSize:20.0f]
# define INCENTIVE_NAME_FONT_SIZE [UIFont systemFontOfSize:15.0f]
# define STATUS_TITLE_FONT_SIZE [UIFont systemFontOfSize:13.0f]
# define STATUS_FONT_SIZE [UIFont systemFontOfSize:12.0f]
# define POINTS_FONT_SIZE [UIFont systemFontOfSize:15.0f]

@interface UIView (Common)

@end


@interface UIColor (Common)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)defaultPageBGColor;
+ (UIColor *)defaultTextColor;
+ (UIColor *)defaultSeparatorColor;

+ (UIColor *)blueColorABI;
+ (UIColor *)cyanColorABI;
+ (UIColor *)whiteColorABI;
+ (UIColor *)blackColorABI;
+ (UIColor *)greenColorABI;
+ (UIColor *)orangeColorABI;
+ (UIColor *)redColorABI;
+ (UIColor *)darkGreyColorABI;
+ (UIColor *)lightGreyColorABI;
+ (UIColor *)defaultABIThemeBlueColor;
@end


@interface UIFont (Common)

+ (UIFont *)defaultTextFont;
+ (UIFont *)userRankTextFont;
+ (UIFont *)badgeNumberTextFont;


@end