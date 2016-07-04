//
//  AnnouncementsViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AnnouncementsViewController.h"
#import "Constants.h"
#import "KPIRankingViewController.h"


@implementation AnnouncementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KPIRankingViewController *kPIRankingViewController=(KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"KPIRankingViewController"];
    
    kPIRankingViewController.view.frame = self.view.bounds;
    [self.view addSubview:kPIRankingViewController.view];
    [self addChildViewController:kPIRankingViewController];
    [kPIRankingViewController didMoveToParentViewController:self];
}

@end
