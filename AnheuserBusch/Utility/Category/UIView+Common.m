	//
	//  UIView+Common.m
	//  AnheuserBusch
	//
	//  Created by Prsenjit Goswami on 11/06/16.
	//  Copyright © 2016 Cognizant. All rights reserved.
	//

#import "UIView+Common.h"
 #import "Constants.h"

@implementation UIView (Common)

@end


#pragma mark - UIColor

@implementation UIColor (Common)


	// takes @"#123456"
+ (UIColor *)colorWithHexString:(NSString *)hexString {
	
	if(hexString.length) {
		const char *cStr = [hexString cStringUsingEncoding:NSASCIIStringEncoding];
		long x = strtol(cStr+1, NULL, 16);
		return [UIColor colorWithHex:x];
	}
	return nil;
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
	
	return [UIColor lightGreyColorABI];
}

+ (UIColor *)defaultTextColor {
	
	
	return [UIColor colorWithRed:34.0/255.0f green:17.0/255.0f blue:0.0f/255.0f alpha:1.0];
	
}

+ (UIColor *)defaultSeparatorColor {
	
	return [UIColor colorWithRed:192.0f/255.0f green:185.0/255.0f blue:169.0f/255.0f alpha:1.0];
	
}

+ (UIColor *)incentiveExceededColor {
	
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_8dba00_GREEN];
	
}

+ (UIColor *)incentiveMinimumColor {
	
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_fe9611_ORANGE];
	
}

+ (UIColor *)incentiveVeryLessColor {
	
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_f25957_OFFRED];
	
}

+ (UIColor *)defaultABIThemeBlueColor {
    
    return [UIColor blueColorABI];
}

+ (UIColor *)blueColorABI {

	return [UIColor colorWithHexString:HEX_COLOR_CODE_0e71b9_BLUE];

}

+ (UIColor *)cyanColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_7ad2f7_SKY];
}

+ (UIColor *)whiteColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_ffffff_WHITE];
}

+ (UIColor *)blackColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_000000_BLACK];
}

+ (UIColor *)greenColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_8dba00_GREEN];
}

+ (UIColor *)orangeColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_fe9611_ORANGE];
}

+ (UIColor *)redColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_f25957_OFFRED];
}

+ (UIColor *)darkGreyColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_cccccc_DARK_GREY];
}

+ (UIColor *)lightGreyColorABI {
	
	return [UIColor colorWithHexString:HEX_COLOR_CODE_333333_LIGHTGREY];
}

+ (UIColor *)colorForIncentiveInPercentage:(CGFloat)multiplier {
    
    if(multiplier > 0.8) {
        
        return [UIColor incentiveExceededColor];
    } else if(multiplier > 0.4) {
        
        return [UIColor incentiveMinimumColor];
    } else {
        
        return [UIColor incentiveVeryLessColor];
    }
    
    return nil;
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
