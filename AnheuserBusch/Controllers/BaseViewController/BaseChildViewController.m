//
//  BaseChildViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "BaseChildViewController.h"
#import "AnnouncementsViewController.h"
#import "CustomSideMenuController.h"

@interface BaseChildViewController ()

@end

@implementation BaseChildViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification"] style:UIBarButtonItemStylePlain target:self action:@selector(clickedNotificationButton)];
	self.navigationItem.rightBarButtonItem = menuButton;
    
    [self addLeftEdgeGesture];
}


- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
		
		self.navigationController.interactivePopGestureRecognizer.enabled = NO;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

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

#pragma mark - IB Action

- (void)clickedNotificationButton {
	
    AnnouncementsViewController *announcementsViewController = (AnnouncementsViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDAnnouncementsViewController];
    
    
    [self.navigationController pushViewController:announcementsViewController animated:YES];

	
}



@end
