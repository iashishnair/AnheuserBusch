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
+ (void)sameWidth:(nullable id )anItem toItem:(nullable id) toItem;
+ (void)sameHeight:(nullable id )anItem toItem:(nullable id) toItem;
+ (void)verticallyCenter:(nullable id )anItem toItem:(nullable id) toItem;
+ (void)horizontallyCenter:(nullable id )anItem toItem:(nullable id) toItem;

@end
