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

@interface NSUserDefaults (HelperUtil)

+ (void)saveObject:(nullable id)object forKey:(nonnull NSString *)key;
+ (nullable id)readUserDefault:(nonnull NSString *)key;

@end



/*!
 *   NSString Helper
 */

@interface NSString (HelperUtil)

+ (BOOL)isNULLString:(nullable NSString *)aString;

- (nonnull NSString *)nullStringTextCorrection ;
@end

/*!
 *   UIView Helper
 */
@interface  UIView (HelperUtil)

+ (nullable instancetype)loadViewFromNIB ;

- (void)fitToParentView:(nullable UIView * ) toItem;
- (void)widthMultiplierBy:(CGFloat)multiplier toItem:(nonnull id)toItem;
- (void)heightMultiplierBy:(CGFloat)multiplier toItem:(nonnull id)toItem;
- (void)centerXToItem:(nonnull id)toItem;
@end


@interface UIViewController (CurrentPageIndex)

@property (nonatomic, assign) NSUInteger pageIndex;
+ (nullable instancetype)instantiateViewControllerWithIdentifier:(nonnull NSString *)identifier;

@end