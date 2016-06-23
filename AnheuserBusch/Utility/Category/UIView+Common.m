//
//  UIView+Common.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

@end


#pragma mark - UIColor 

@implementation UIColor (Common)

+ (UIColor *) defaultPageBGColor {
	
	return [UIColor colorWithRed:123.0f/255.0f green:123.0f/255.0f blue:123.0f/255.0f alpha:1.0];
}


+ (UIColor *)defaultTextColor {
    
    
    return [UIColor colorWithRed:34.0/255.0f green:17.0/255.0f blue:0.0f/255.0f alpha:1.0];

    // 192.185,169
    
    // 34, 17, 0
}

+ (UIColor *)defaultSeparatorColor {
    
    
    return [UIColor colorWithRed:192.0f/255.0f green:185.0/255.0f blue:169.0f/255.0f alpha:1.0];
    
    // 192.185,169
    
    // 34, 17, 0
}
@end

@implementation UIFont (Common)

+ (UIFont *)defaultTextFont {
    return [UIFont systemFontOfSize:14.0f];
}

+ (UIFont *)userRankTextFont {
    return [UIFont systemFontOfSize:14.0f];
}

+(UIFont *)badgeNumberTextFont {
    return [UIFont systemFontOfSize:28.0f];
}

@end
