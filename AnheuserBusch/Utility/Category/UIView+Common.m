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


	// takes @"#123456"
+ (UIColor *)colorWithHexString:(NSString *)str {
	const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
	long x = strtol(cStr+1, NULL, 16);
	return [UIColor colorWithHex:x];
}

	// takes 0x123456
+ (UIColor *)colorWithHex:(UInt32)col {
	unsigned char r, g, b;
	b = col & 0xFF;
	g = (col >> 8) & 0xFF;
	r = (col >> 16) & 0xFF;
	return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

+ (UIColor *) defaultPageBGColor {
	
	return [UIColor colorWithRed:236.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:1.0];
}

+(UIColor *)defaultThemeBlueColor {
    
    return [UIColor colorWithRed:32.0f/255.0f green:114.0f/255.0f blue:183.0f/255.0f alpha:1.0];
}


+ (UIColor *)defaultTextColor {
    
    
    return [UIColor colorWithRed:34.0/255.0f green:17.0/255.0f blue:0.0f/255.0f alpha:1.0];

}

+ (UIColor *)defaultSeparatorColor {
    
    return [UIColor colorWithRed:192.0f/255.0f green:185.0/255.0f blue:169.0f/255.0f alpha:1.0];
   
}


+ (UIColor *)incentiveExceededColor {
    
    
    return [UIColor redColor];

}

+ (UIColor *)incentiveMinimumColor {
    
    
    return [UIColor greenColor];
    
}

+ (UIColor *)incentiveVeryLessColor {
    
    
    return [UIColor orangeColor];
    
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
