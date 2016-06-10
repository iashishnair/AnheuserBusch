//
//  NSObject+HelperUtil.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "NSObject+HelperUtil.h"

#pragma mark - NSObject Helper

@implementation NSObject (HelperUtil)

+ (void)performInMainThreadAfterDelay:(NSTimeInterval)delayInterval
                          completion:(void(^)(void))completion {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    if(completion)
        completion ();
    });
}


@end

#pragma mark - UIView Helper

@implementation UIView (HelperUtil)

/*!
 *  Load view from nib
 *
 */

+ (instancetype)loadViewFromNIB {
    
   NSArray * nibs =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    
    return (nibs && nibs.count) ? [nibs firstObject] : nil;
}

/*!
 *  Add NSLay
 *
 *
 */
- (void)fitToParentView:(nullable UIView * ) toItem {
    
    if(!toItem) return;
    
    
        toItem.translatesAutoresizingMaskIntoConstraints = NO;
    [toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[selfView]|" options:0 metrics:nil views:@{@"selfView": self}]];
    
    [toItem addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[selfView]|" options:0 metrics:nil views:@{@"selfView": self}]];

}
@end