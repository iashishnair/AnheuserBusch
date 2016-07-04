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
    
    if(!anItem || !toItem ) return ;
    
    
    [toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[anItem]|" options:0 metrics:nil views:@{@"anItem": anItem}]];
    
    [toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[anItem]|" options:0 metrics:nil views:@{@"anItem": anItem}]];
}


+ (nullable NSLayoutConstraint *)sameWidth:(nullable id )anItem toItem:(nullable id) toItem {
    
    if(!anItem || !toItem ) return nil;
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [toItem addConstraint:constraint];
    
    return constraint;
    
}


+ (nullable NSLayoutConstraint *)sameHeight:(nullable id )anItem toItem:(nullable id) toItem {
    
    if(!anItem || !toItem ) return nil;
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [toItem addConstraint:constraint];
    
    return constraint;
}

+ (nullable NSLayoutConstraint *)height:(nullable id )anItem toItem:(nullable id) toItem multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    if(!anItem || !toItem ) return nil;
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeHeight multiplier:multiplier constant:c];
    
//    [toItem addConstraint:constraint];
	
    return constraint;
}


+ (nullable NSLayoutConstraint *)width:(nullable id )anItem toItem:(nullable id) toItem multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    if(!anItem || !toItem ) return nil;
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeWidth multiplier:multiplier constant:c];
    
//    [toItem addConstraint:constraint];
	
    return constraint;
}


+ (nullable NSLayoutConstraint *)verticallyCenter:(nullable id )anItem toItem:(nullable id) toItem {
    
    if(!anItem || !toItem ) return nil;
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    
    [toItem addConstraint:constraint];
    return constraint;
    
}


+ (nullable NSLayoutConstraint *)horizontallyCenter:(nullable id )anItem toItem:(nullable id) toItem {
    
    if(!anItem || !toItem ) return nil;
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:anItem attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [toItem addConstraint:constraint];
    
    return constraint;
}

@end
