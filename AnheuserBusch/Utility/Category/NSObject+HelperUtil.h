//
//  NSObject+HelperUtil.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 *   UIView Helper
 */

@interface NSObject (HelperUtil)

+ (void)performInMainThreadAfterDelay:(NSTimeInterval)delayInterval
                           completion:(void(^ _Nonnull)(void))completion;
@end


/*!
 *   UIView Helper
 */
@interface  UIView (HelperUtil)

+ (nullable instancetype)loadViewFromNIB ;

- (void)fitToParentView:(nullable UIView * ) toItem;

@end


@interface UIViewController (CurrentPageIndex)

@property (nonatomic, assign) NSUInteger pageIndex;

@end