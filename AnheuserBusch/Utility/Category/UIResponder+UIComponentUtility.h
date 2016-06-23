	//
	//  UIResponder+UIComponentUtility.h
	//  AnheuserBusch
	//
	//  Created by Prsenjit Goswami on 11/06/16.
	//  Copyright © 2016 Cognizant. All rights reserved.
	//

#import <UIKit/UIKit.h>

@interface UIResponder (UIComponentUtility)

@end

	// MARK: -------------- UIButton -----------------

@interface UIButton (UIComponentUtility)

+(nullable UIButton *)customButtonWithImage:(nullable UIImage *)image
							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;

+(nullable UIButton *)customButtonWithImage:(nullable UIImage *)image
							   cornerRadius:(CGFloat)cornerRadius
				   borderLineWidth:(CGFloat)borderLineWidth
				   borderLineColor:(nullable UIColor *)borderLineColor

							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;

+(nullable UIButton *)customButtonWithTitle:(nullable NSString *)title
								 titleColor:(nullable UIColor *)titleColour
								  titleFont:(nullable UIFont *)titleFont
				   backgroungImage:(nullable UIImage *)backgroundImage
							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;

+(nullable UIButton *)customButtonWithTitle:(nullable NSString *)title
								 titleColor:(nullable UIColor *)titleColour
								  titleFont:(nullable UIFont *)titleFont
				   backgroungImage:(nullable UIImage *)backgroundImage
							   cornerRadius:(CGFloat)cornerRadius
				   borderLineWidth:(CGFloat)borderLineWidth
				   borderLineColor:(nullable UIColor *)borderLineColor
							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;

+(nullable UIButton *)customButtonWithTitle:(nullable NSString *)title
								 titleColor:(nullable UIColor *)titleColour
								  titleFont:(nullable UIFont *)titleFont
				   backgroungColor:(nullable UIColor *)backgroungColor
							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;

+(nullable UIButton *)customButtonWithTitle:(nullable NSString *)title
								 titleColor:(nullable UIColor *)titleColour
								  titleFont:(nullable UIFont *)titleFont
				   backgroungColor:(nullable UIColor *)backgroungColor
							   cornerRadius:(CGFloat)cornerRadius
				   borderLineWidth:(CGFloat)borderLineWidth
				   borderLineColor:(nullable UIColor *)borderLineColor
							   tag:(NSInteger)tag
								  addTarget:(nullable id)target
									 action:(nullable SEL)action
						   forControlEvents:(UIControlEvents)controlEvents;
;

+(nullable UIButton *)customButtonWithBackgroungImage:(nullable UIImage *)backgroundImage
									  backgroungColor:(nullable UIColor *)backgroungColor
												  tag:(NSInteger)tag
											addTarget:(nullable id)target
											   action:(nullable SEL)action
									 forControlEvents:(UIControlEvents)controlEvents;


+(nullable UIButton *)customButtonWithBackgroungImage:(nullable UIImage *)backgroundImage
									  backgroungColor:(nullable UIColor *)backgroungColor
										 cornerRadius:(CGFloat)cornerRadius
									  borderLineWidth:(CGFloat)borderLineWidth
									  borderLineColor:(nullable UIColor *)borderLineColor
												  tag:(NSInteger)tag
											addTarget:(nullable id)target
											   action:(nullable SEL)action
									 forControlEvents:(UIControlEvents)controlEvents;
@end



@interface UILabel (UIComponentUtility)

+ (nonnull UILabel *)labelWithText:(nonnull NSString *)text
						 textColor:(nullable UIColor *)textColor
						  textFont:(nullable UIFont *)textFont
					 textAlignment:(NSTextAlignment) textAlignment
					 numberOfLines:(NSInteger)numberOfLines
				   backgroundColor:(nullable UIColor *)backgroundColor;
@end

