//
//  PageHeaderView.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageHeaderViewDelegate.h"

@interface PageHeaderView : UIView

-(void)setPageTitle:(nullable NSString *)pageTitle;

@property (weak, nonatomic,nullable) id <PageHeaderViewDelegate> delegate;

@end
