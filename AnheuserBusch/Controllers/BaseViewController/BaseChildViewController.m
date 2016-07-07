//
//  BaseChildViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "BaseChildViewController.h"
#import "AnnouncementsViewController.h"

@interface BaseChildViewController ()

@end

@implementation BaseChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification"] style:UIBarButtonItemStylePlain target:self action:@selector(clickedNotificationButton)];
	self.navigationItem.rightBarButtonItem = menuButton;

}


- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
		
		self.navigationController.interactivePopGestureRecognizer.enabled = NO;
	}
	
}

- (void)clickedNotificationButton {
	
    AnnouncementsViewController *announcementsViewController = (AnnouncementsViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDAnnouncementsViewController];
    
    
    [self.navigationController pushViewController:announcementsViewController animated:YES];

	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
