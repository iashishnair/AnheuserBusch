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
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UILabel *rank;



@end


@implementation PeerProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.peerDataModel =
    
    [self configureUI];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    }

-(void)configureUI {
    
    self.userName.text = self.peerDataModel.userName;
    self.points.text = self.peerDataModel.incentivePoints;
    self.rank.text = self.peerDataModel.userRank;
    
    KPIRankingViewController *kPIRankingViewController=(KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"KPIRankingViewController"];
    
    kPIRankingViewController.view.frame = self.kPIDetailsView.bounds;
    [self.kPIDetailsView addSubview:kPIRankingViewController.view];
    [self addChildViewController:kPIRankingViewController];
    [kPIRankingViewController didMoveToParentViewController:self];
    
}

@end
