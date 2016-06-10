//
//  UIViewController+CurrentPageIndex.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "UIViewController+CurrentPageIndex.h"
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

@end
