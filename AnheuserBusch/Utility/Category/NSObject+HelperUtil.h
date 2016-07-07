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
+ (BOOL)isNullObject:(nullable id)object;
+ (nullable id)objectForKeySafe:(nullable id) object key:(nullable NSString *)key;
+ (nullable id)valueForKeySafe:(nullable id) object key:(nullable NSString *)key;

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
- (void)centerXToParent:(nonnull id)toItem;
-(void)addConstraintsWithVisualFormat:(nullable NSString *)format options:(NSLayoutFormatOptions)opts metrics:(nullable NSDictionary<NSString *,id> *)metrics views:(nonnull NSDictionary<NSString *, id> *)views ;
@end


@interface UIViewController (CurrentPageIndex)

@property (nonatomic, assign) NSUInteger pageIndex;
+ (nullable instancetype)instantiateViewControllerWithIdentifier:(nonnull NSString *)identifier;

@end


@interface NSDictionary (HelperUtil)

+ (BOOL)isValidDictionary:(nullable NSDictionary *)dictionary;
- (nullable id)valueForKeySafe:(nonnull NSString *)key;

@end

@interface NSArray (HelperUtil)
+ (nullable id)objectFromArray:(nullable NSArray *)anArray atIndex:(NSUInteger)index;
@end
