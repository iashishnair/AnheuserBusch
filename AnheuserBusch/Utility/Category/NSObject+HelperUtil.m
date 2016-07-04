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

/*!
 *  Perform event in main thread after delay
 *
 *  @param delayInterval Delay Interval
 *  @param completion    Completion block
 */

+ (void)performInMainThreadAfterDelay:(NSTimeInterval)delayInterval
                           completion:(void(^)(void))completion {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if(completion)
            completion ();
    });
}

+ (BOOL)isNullObject:(id)object {
    
    if([object isKindOfClass:[NSNull class]]) return YES;
    
    return (object == nil);
    
}

+ (id)objectForKeySafe:(id) object key:(NSString *)key {
    
    
    id returnValue = nil;
    
    if(![NSObject isNullObject:object] && ![NSString isNULLString:key]) {
        
        if([object isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *objectAsDict = (NSDictionary *)object;
            
            if([[objectAsDict allKeys] containsObject:key])
                returnValue = [objectAsDict objectForKey:key];
        }
    }
    
    return returnValue;
}

+(id)valueForKeySafe:(id) object key:(NSString *)key {
    
    
    id returnValue = nil;
    
    if(![NSObject isNullObject:object] && ![NSString isNULLString:key]) {
        
        if([object isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *objectAsDict = (NSDictionary *)object;
            
            if([[objectAsDict allKeys] containsObject:key])
                returnValue = [objectAsDict valueForKey:key];
        }
    }
    
    return returnValue;
}


@end




@implementation NSUserDefaults (HelperUtil)

+ (void)saveObject:(id)object forKey:(NSString *)key {
    
    
    if([NSString isNULLString:key]) return;
    
    [[NSUserDefaults standardUserDefaults]setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];

}


+ (id)readUserDefault:(NSString *)key {
    
    
    if([NSString isNULLString:key]) return nil;
    
   return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}


@end




#pragma mark - NSString Helper

@implementation NSString (HelperUtil)

/*!
 *  Check null string
 *
 *  @param aString Input string
 *
 */
+ (BOOL)isNULLString:(nullable NSString *)aString {
	
    if([aString isKindOfClass:[NSNull class]]) return NO;
    
    if(aString.length && [aString isEqualToString:@"<null>"]) return NO;
    
	return !(aString && aString.length);
}


- (NSString *)nullStringTextCorrection {
    
    
    NSString *result = self;
    
    return ![NSString isNULLString:result] ? result : @"";

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

- (void)widthMultiplierBy:(CGFloat)multiplier toItem:(id)toItem   {
    
    if(!toItem) return;
    
    [toItem addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeWidth multiplier:multiplier constant:0]];
}

- (void)heightMultiplierBy:(CGFloat)multiplier toItem:(id)toItem   {
    
    if(!toItem) return;
    
    [toItem addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeHeight multiplier:multiplier constant:0]];
}

- (void)centerXToItem:(id)toItem   {
    
    if(!toItem) return;
    
    [toItem addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

@end

#pragma mark - UIViewController Helper

#import <objc/runtime.h>

@implementation UIViewController (CurrentPageIndex)

- (NSUInteger)pageIndex {
	
	id pageIndexObject = objc_getAssociatedObject(self, @selector(pageIndex));
	
	return [pageIndexObject integerValue];
}

- (void)setPageIndex:(NSUInteger)pageIndex {
	
	objc_setAssociatedObject(self, @selector(pageIndex), @(pageIndex), OBJC_ASSOCIATION_ASSIGN);
}

-(NSString*)pageTitle {
	
	id pageTitleObject = objc_getAssociatedObject(self, @selector(pageTitle));
	
	return pageTitleObject;
	
}

- (void)setPageTitle:(NSString*)pageTitle {
	
	objc_setAssociatedObject(self, @selector(pageTitle), pageTitle,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (instancetype)instantiateViewControllerWithIdentifier:(NSString *)identifier {
    
    UIViewController * profileViewController = nil;
    
    if(identifier.length) {
    
    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   
        if(mystoryboard)
        profileViewController = [mystoryboard instantiateViewControllerWithIdentifier:identifier];
    }
    
    return profileViewController;
    
}

@end

@implementation NSDictionary (HelperUtil)

+ (BOOL)isValidDictionary:(NSDictionary *)dictionary {
    
   return  ![dictionary isKindOfClass:[NSNull class]] && dictionary && dictionary.count;
}

- (id)valueForKeySafe:(NSString *)key {
    
    if([NSString isNULLString:key]) return nil;
    
    id object = nil;
    
    if([NSDictionary isValidDictionary:self] && [[self allKeys]containsObject:key]) {
        
        object = self[key];
        
    }
    
    return object;
}


@end

@implementation NSArray (HelperUtil)

+ (nullable id)objectFromArray:(nullable NSArray *)anArray atIndex:(NSUInteger)index {
    
    if(![anArray isKindOfClass:[NSNull class]] && anArray && anArray.count > index ) {
        
        return  anArray[index];
    }
    
    return nil;
}

@end
