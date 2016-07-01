//
//  NSLayoutConstraint+LayoutConstraintHelper.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (LayoutConstraintHelper)

+ (void)fitToWithItem:(nullable id )anItem toItem:(nullable id) toItem;
+ (nullable NSLayoutConstraint *)sameWidth:(nullable id )anItem toItem:(nullable id) toItem;
+ (nullable NSLayoutConstraint *)sameHeight:(nullable id )anItem toItem:(nullable id) toItem;

+ (nullable NSLayoutConstraint *)verticallyCenter:(nullable id )anItem toItem:(nullable id) toItem;
+ (nullable NSLayoutConstraint *)horizontallyCenter:(nullable id )anItem toItem:(nullable id) toItem;

+ (nullable NSLayoutConstraint *)height:(nullable id )anItem toItem:(nullable id) toItem multiplier:(CGFloat)multiplier constant:(CGFloat)c ;
+ (nullable NSLayoutConstraint *)width:(nullable id )anItem toItem:(nullable id) toItem multiplier:(CGFloat)multiplier constant:(CGFloat)c;
@end
