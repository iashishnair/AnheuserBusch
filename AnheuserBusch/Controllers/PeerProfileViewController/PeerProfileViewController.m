//
//  PeerProfileViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PeerProfileViewController.h"
#import "KPIRankingViewController.h"
#import "Constants.h"

@interface PeerProfileViewController()
@property (weak, nonatomic) IBOutlet UIView *kPIDetailsView;



@end


@implementation PeerProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KPIRankingViewController *kPIRankingViewController=(KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"KPIRankingViewController"];

    kPIRankingViewController.view.frame = self.kPIDetailsView.bounds;
    [self.kPIDetailsView addSubview:kPIRankingViewController.view];
    [self addChildViewController:kPIRankingViewController];
    [kPIRankingViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    }

@end
