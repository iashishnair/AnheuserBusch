//
//  PageBaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PageBaseViewController.h"
#import "CustomSideMenuController.h"

@implementation PageBaseViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor defaultPageBGColor];
	
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:[UIImage imageNamed:@"notification"]];

}
@end
