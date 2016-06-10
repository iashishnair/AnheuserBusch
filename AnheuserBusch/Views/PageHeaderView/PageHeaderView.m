//
//  PageHeaderView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PageHeaderView.h"

@interface PageHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *notificationButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *pageTitleLabel;


@end

@implementation PageHeaderView

#pragma mark - Public Method

-(void)setPageTitle:(nullable NSString *)pageTitle
{
    
    if(_pageTitleLabel) {
        
        _pageTitleLabel.text = pageTitle;
    }
}


#pragma mark- IB Action

- (IBAction)clickedMenuButton:(id)sender {
    
    if(_delegate && [_delegate respondsToSelector:@selector(clickedMenuButton:)]) {
        
        [_delegate clickedMenuButton:sender];
    }
}
- (IBAction)clickedNotificationButton:(id)sender {
    
    if(_delegate && [_delegate respondsToSelector:@selector(clickedNotificationButton:)]) {
        
        [_delegate clickedNotificationButton:sender];
    }
}


@end
