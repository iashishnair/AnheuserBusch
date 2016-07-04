//
//  PageBaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PageBaseViewController.h"
#import "CustomSideMenuController.h"
#import "AnnouncementsViewController.h"

@implementation PageBaseViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor defaultPageBGColor];
	
	[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:[UIImage imageNamed:@"notification"]];

	
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
	
	[super viewWillDisappear:animated];

}

- (void)addLeftMenuButtonWithImage:(UIImage *)buttonImage {
	
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(toggleMenu)];
	self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)addRightMenuButtonWithImage:(UIImage *)buttonImage {
	
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(clickedNotificationButton)];
	self.navigationItem.rightBarButtonItem = menuButton;
}

- (void)commonHeaderWithLeftMenuButtonImage:(UIImage *)leftMenuButtonImage
					   rightMenuButtonImage:(UIImage *)rightMenuButtonImage {
	
	if(leftMenuButtonImage) {
		
		[self addLeftMenuButtonWithImage:leftMenuButtonImage];
	}
	
	if(rightMenuButtonImage) {
		
		[self addRightMenuButtonWithImage:rightMenuButtonImage];
	}
	
}

- (void)toggleMenu {
	
	[[self sideMenuController] toggleMenu];
}

- (void)clickedNotificationButton {
    
    AnnouncementsViewController *announcementsViewController = (AnnouncementsViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDAnnouncementsViewController];
    
    [self.navigationController pushViewController:announcementsViewController animated:YES];
    	
}

-(void)setShowMenuButton:(BOOL)showMenuButton {
	
	_showMenuButton = showMenuButton;

	[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:nil];
	
}
- (void)setShowBackButton:(BOOL)showBackButton {
	
	_showBackButton = showBackButton;
	
	self.navigationItem.leftBarButtonItem = nil;

}

@end
