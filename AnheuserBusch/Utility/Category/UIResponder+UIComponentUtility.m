//
//  UIResponder+UIComponentUtility.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "UIResponder+UIComponentUtility.h"

@implementation UIResponder (UIComponentUtility)

@end

#pragma mark - UIButton UIComponentUtility

@implementation UIButton (UIComponentUtility)

+(UIButton *)customButtonWithTitle:(nullable NSString *)title
                        titleColor:(nullable UIColor *)titleColour
                         titleFont:(nullable UIFont *)titleFont
                             image:(nullable UIImage *)image
                   backgroungImage:(nullable UIImage *)backgroundImage
                   backgroungColor:(nullable UIColor *)backgroungColor
                      cornerRadius:(CGFloat)cornerRadius
                   borderLineWidth:(CGFloat)borderLineWidth
                   borderLineColor:(nullable UIColor *)borderLineColor
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = tag ? tag : 0;
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    if(title.length)
    {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateSelected];
        [button setTitle:title forState:UIControlStateHighlighted];
        
    }
    if(cornerRadius>0)
        button.layer.cornerRadius = 5.0f;
    
    if(titleColour)
    {
        [button setTitleColor:titleColour forState:UIControlStateNormal];
        [button setTitleColor:titleColour forState:UIControlStateSelected];
        [button setTitleColor:titleColour forState:UIControlStateHighlighted];
    }
    
    if(titleFont)
        [[button titleLabel] setFont:titleFont];
    
    if(image)
    {
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateSelected];
        [button setImage:image forState:UIControlStateHighlighted];
        
    }
    else if(backgroundImage)
    {
        [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        [button setBackgroundImage:backgroundImage forState:UIControlStateSelected];
        [button setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
    }
    
    if(borderLineWidth && borderLineColor)
    {
        button.layer.borderWidth = borderLineWidth;
        button.layer.borderColor = borderLineColor.CGColor;
        
        
    }
    
    if(backgroungColor)
        button.backgroundColor = backgroungColor;
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    return button;
}

+(UIButton *)customButtonWithImage:(nullable UIImage *)image
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    UIButton *button = [UIButton customButtonWithTitle:nil
                                            titleColor:nil
                                             titleFont:nil
                                                 image:image
                                       backgroungImage:nil
                                       backgroungColor:nil
                                          cornerRadius:0
                                       borderLineWidth:0
                                       borderLineColor:nil
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}


+(UIButton *)customButtonWithImage:(nullable UIImage *)image
                      cornerRadius:(CGFloat)cornerRadius
                   borderLineWidth:(CGFloat)borderLineWidth
                   borderLineColor:(nullable UIColor *)borderLineColor
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    UIButton *button = [UIButton customButtonWithTitle:nil
                                            titleColor:nil
                                             titleFont:nil
                                                 image:image
                                       backgroungImage:nil
                                       backgroungColor:nil
                                          cornerRadius:cornerRadius
                                       borderLineWidth:borderLineWidth
                                       borderLineColor:borderLineColor
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}

+(UIButton *)customButtonWithBackgroungImage:(nullable UIImage *)backgroundImage
                                      backgroungColor:(nullable UIColor *)backgroungColor
                                                  tag:(NSInteger)tag
                                            addTarget:(nullable id)target
                                               action:(nullable SEL)action
                                     forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:nil
                                            titleColor:nil
                                             titleFont:nil
                                                 image:nil
                                       backgroungImage:backgroundImage
                                       backgroungColor:backgroungColor
                                          cornerRadius:0
                                       borderLineWidth:0
                                       borderLineColor:nil
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}

+ (UIButton *)customButtonWithBackgroungImage:(nullable UIImage *)backgroundImage
                                      backgroungColor:(nullable UIColor *)backgroungColor
                                         cornerRadius:(CGFloat)cornerRadius
                                      borderLineWidth:(CGFloat)borderLineWidth
                                      borderLineColor:(nullable UIColor *)borderLineColor
                                                  tag:(NSInteger)tag
                                            addTarget:(nullable id)target
                                               action:(nullable SEL)action
                                     forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:nil
                                            titleColor:nil
                                             titleFont:nil
                                                 image:nil
                                       backgroungImage:backgroundImage
                                       backgroungColor:backgroungColor
                                          cornerRadius:cornerRadius
                                       borderLineWidth:borderLineWidth
                                       borderLineColor:borderLineColor
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}


+(UIButton *)customButtonWithTitle:(nullable NSString *)title
                        titleColor:(nullable UIColor *)titleColour
                         titleFont:(nullable UIFont *)titleFont
                   backgroungImage:(nullable UIImage *)backgroundImage
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:title
                                            titleColor:titleColour
                                             titleFont:titleFont
                                                 image:nil
                                       backgroungImage:backgroundImage
                                       backgroungColor:nil
                                          cornerRadius:0
                                       borderLineWidth:0
                                       borderLineColor:nil
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}


+(UIButton *)customButtonWithTitle:(nullable NSString *)title
                        titleColor:(nullable UIColor *)titleColour
                         titleFont:(nullable UIFont *)titleFont
                   backgroungImage:(nullable UIImage *)backgroundImage
                      cornerRadius:(CGFloat)cornerRadius
                   borderLineWidth:(CGFloat)borderLineWidth
                   borderLineColor:(nullable UIColor *)borderLineColor
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:title
                                            titleColor:titleColour
                                             titleFont:titleFont
                                                 image:nil
                                       backgroungImage:backgroundImage
                                       backgroungColor:nil
                                          cornerRadius:cornerRadius
                                       borderLineWidth:borderLineWidth
                                       borderLineColor:borderLineColor
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}


+(UIButton *)customButtonWithTitle:(nullable NSString *)title
                        titleColor:(nullable UIColor *)titleColour
                         titleFont:(nullable UIFont *)titleFont
                   backgroungColor:(nullable UIColor *)backgroungColor
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:title
                                            titleColor:titleColour
                                             titleFont:titleFont
                                                 image:nil
                                       backgroungImage:nil
                                       backgroungColor:backgroungColor
                                          cornerRadius:0
                                       borderLineWidth:0
                                       borderLineColor:nil
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}
+(UIButton *)customButtonWithTitle:(nullable NSString *)title
                        titleColor:(nullable UIColor *)titleColour
                         titleFont:(nullable UIFont *)titleFont
                   backgroungColor:(nullable UIColor *)backgroungColor
                      cornerRadius:(CGFloat)cornerRadius
                   borderLineWidth:(CGFloat)borderLineWidth
                   borderLineColor:(nullable UIColor *)borderLineColor
                               tag:(NSInteger)tag
                         addTarget:(nullable id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents

{
    
    
    UIButton *button = [UIButton customButtonWithTitle:title
                                            titleColor:titleColour
                                             titleFont:titleFont
                                                 image:nil
                                       backgroungImage:nil
                                       backgroungColor:backgroungColor
                                          cornerRadius:cornerRadius
                                       borderLineWidth:borderLineWidth
                                       borderLineColor:borderLineColor
                                                   tag:(NSInteger)tag
                                             addTarget:target
                                                action:action
                                      forControlEvents:controlEvents];
    
    return button;
    
    
}

@end


#pragma mark - UILabel UIComponentUtility

@implementation UILabel (UIComponentUtility)


+ (nonnull UILabel *)labelWithText:(nonnull NSString *)text
                         textColor:(nullable UIColor *)textColor
                          textFont:(nullable UIFont *)textFont
                     textAlignment:(NSTextAlignment) textAlignment
                     numberOfLines:(NSInteger)numberOfLines
                   backgroundColor:(nullable UIColor *)backgroundColor

{
    UILabel *label  = [UILabel new];
    if(text.length)
        label.text = text;
    label.textAlignment = textAlignment;
    if(backgroundColor)
        label.backgroundColor = backgroundColor;
    label.numberOfLines = numberOfLines !=1 ? numberOfLines :1 ;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    if(textFont)
        label.font = textFont;
    
    if(textColor)
        label.textColor = textColor;
	
	
	label.translatesAutoresizingMaskIntoConstraints = NO;
	
//	if(label.translatesAutoresizingMaskIntoConstraints)
//        label.autoresizingMask =  UIViewAutoresizingFlexibleWidth;
	
    return label;
}

@end

@implementation UIImageView (UIComponentUtility)

+ (UIImageView *)initWithImage:(UIImage *)image {
	
	UIImageView *imageView = [UIImageView new];
	imageView.translatesAutoresizingMaskIntoConstraints = NO;

	if(image)
		imageView.image = image;
	
	return imageView;
}


- (void)imageWithURLString:(NSString *)imageURLString {
    
    if(imageURLString.length) {
        
        __weak typeof(self) weakSelf = self;

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *image = [weakSelf getImageFromURL:imageURLString];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image =   image;
                
            });
            
           
        });
    }
    
}

-(UIImage *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}


@end

@implementation UITableView (UIComponentUtility)

+ (UITableView *)plainTableView {
	
	UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	
	return tableView;
}

+ (UITableView *)groupedTableView {
	
	UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	
	return tableView;
}

@end
