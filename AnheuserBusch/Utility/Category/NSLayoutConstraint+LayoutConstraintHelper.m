//
//  NSLayoutConstraint+LayoutConstraintHelper.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "NSLayoutConstraint+LayoutConstraintHelper.h"

@implementation NSLayoutConstraint (LayoutConstraintHelper)

+ (void)fitToWithItem:(nullable id )anItem toItem:(nullable id) toItem {
	
	if(!anItem || !toItem ) return;
	

	[toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[anItem]|" options:0 metrics:nil views:@{@"anItem": anItem}]];
	
	[toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anItem]|" options:0 metrics:nil views:@{@"anItem": anItem}]];
}


+ (void)sameWidth:(nullable id )anItem toItem:(nullable id) toItem {
	
	if(!anItem || !toItem ) return;
	
	
	[toItem addConstraint:[NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
}


+ (void)sameHeight:(nullable id )anItem toItem:(nullable id) toItem {
	
	if(!anItem || !toItem ) return;
	
	
	[toItem addConstraint:[NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
}

+ (void)verticallyCenter:(nullable id )anItem toItem:(nullable id) toItem {
	
	if(!anItem || !toItem ) return;
	
	
	[toItem addConstraint:[NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}


+ (void)horizontallyCenter:(nullable id )anItem toItem:(nullable id) toItem {
	
	if(!anItem || !toItem ) return;
	
	
	[toItem addConstraint:[NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}


@end
