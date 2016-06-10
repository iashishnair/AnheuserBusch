//
//  LeaderBoardViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "LeaderBoardViewController.h"
#import "Constants.h"

#import "RankingSwitchView.h"

@interface LeaderBoardViewController () <RankingSwitchViewDelegate,
RankingSwitchViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *weekelyLabel;

@property (weak, nonatomic) IBOutlet UIButton *calenderButton;
@property (weak, nonatomic) IBOutlet UIView *rakingSwitchContainerView;
@property (weak, nonatomic) IBOutlet UIView *salesTargetDropDownContainerView;
@property (weak, nonatomic) IBOutlet UIView *carouselContainerView;
@property (weak, nonatomic) IBOutlet UIView *leaderBoardListTableview;

@end

@implementation LeaderBoardViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];

    [self configureUI];
}

#pragma mark - Private Method 

- (void)configureUI {
    
    [self initialishedRankingSwitchView];
    
}

- (void)initialishedRankingSwitchView {
    
    RankingSwitchView *rankingSwitchView = [RankingSwitchView loadViewFromNIB];
   
    if(rankingSwitchView) {
        rankingSwitchView.delegate = self;
        rankingSwitchView.datasource =self;
        rankingSwitchView.translatesAutoresizingMaskIntoConstraints = NO;
        [ self.rakingSwitchContainerView addSubview:rankingSwitchView ];

        [rankingSwitchView fitToParentView:self.rakingSwitchContainerView];
    }
}

#pragma mark -  RankingSwitchViewDataSource

- (nonnull UIColor *)textColor {
    
    return [UIColor blackColor];
}
- (nonnull UIColor *)colorInHighlightState {
    
    return [UIColor blackColor];

}


- (nonnull UIColor *)textColorInNormalState {
    
    return [UIColor blueColor];

}
- (nonnull UIColor *)textColorInHighlightState {
    
    return [UIColor blackColor];

}

@end
