//
//  PageBaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomSideMenuController.h"
#import "AnnouncementsViewController.h"
#import "AnnouncementDataModel.h"

@interface BaseViewController()


@end

@implementation BaseViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor defaultPageBGColor];
	
	if(self.navigationController.viewControllers.count>1) {
		
		[self commonHeaderWithLeftMenuButtonImage:nil rightMenuButtonImage:[UIImage imageNamed:@"notification"]];
	}
	else {
		
			[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:[UIImage imageNamed:@"notification"]];
	}

	
	
	

	
//	[[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColorABI], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0], NSFontAttributeName, nil]];
//
//	[[UINavigationBar appearance] setTintColor:[UIColor blueColorABI]];
//	
		// Navigation bar buttons appearance
	
		// Navigation bar buttons appearance
	
//	[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor : [UIColor whiteColor]};

	
 self.navigationController.navigationBar.barTintColor = [UIColor blueColorABI];
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

	[self addLeftEdgeGesture];

}

- (void)addLeftEdgeGesture {
	UIScreenEdgePanGestureRecognizer *leftEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftEdgeGesture:)];
	leftEdgeGesture.edges = UIRectEdgeLeft;
	leftEdgeGesture.delegate = self.navigationController.interactivePopGestureRecognizer.delegate;
	[self.view addGestureRecognizer:leftEdgeGesture];
}
- (void)handleLeftEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
		// Get the current view we are touching
		//    UIView *view = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
	
	if(
	   
	   UIGestureRecognizerStateBegan == gesture.state) {
		
		[[self sideMenuController] toggleMenu];
		
	}
}



- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
		
		self.navigationController.interactivePopGestureRecognizer.enabled = NO;
	}
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
	

	[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:nil];
	
}
- (void)setShowBackButton:(BOOL)showBackButton {
	
	self.navigationItem.leftBarButtonItem = nil;

}




@end
