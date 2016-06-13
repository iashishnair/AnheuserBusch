//
//  LeaderBoardViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "LeaderBoardViewController.h"
#import "RankingSwitchView.h"
#import "RankingCarouselView.h"
#import "LeaderBoardViewControllerPresenter.h"

@interface LeaderBoardViewController () <RankingSwitchViewDelegate,
RankingSwitchViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *weekelyLabel;
@property (weak, nonatomic) IBOutlet UIButton *calenderButton;
@property (weak, nonatomic) IBOutlet UIView *rakingSwitchContainerView;
@property (weak, nonatomic) IBOutlet UIView *salesTargetDropDownContainerView;
@property (weak, nonatomic) IBOutlet UIView *carouselContainerView;
@property (weak, nonatomic) IBOutlet UIView *leaderBoardListTableview;
@property (strong, nonatomic) id <LeaderBoardViewProtocol> presenter;
@property (weak, nonatomic) IBOutlet UIButton *SalesTargetButton;

@end

@implementation LeaderBoardViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor defaultPageBGColor];

    [self configureUI];
}

#pragma mark - Private Method 


//MARK: Getter Method

- (id <LeaderBoardViewProtocol>)presenter {
    
    if(!_presenter) {
        
        _presenter = [LeaderBoardViewControllerPresenter new];
    }
    
    return _presenter;
}

// UI
- (void)configureUI {
    
    self.weekelyLabel.textColor = [UIColor defaultTextColor];
  
    [self initialishedRankingSwitchView];
    
    [self initialishedRankingCarousalView];
    
}

- (void)initialishedRankingSwitchView {
    
    RankingSwitchView *rankingSwitchView = [[RankingSwitchView alloc]init];
   
    if(rankingSwitchView) {
		
        rankingSwitchView.delegate = self;
        rankingSwitchView.datasource = self;
        rankingSwitchView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.rakingSwitchContainerView addSubview:rankingSwitchView];
        [rankingSwitchView fitToParentView:self.rakingSwitchContainerView];
    }
}

- (void)initialishedRankingCarousalView {
    
    RankingCarouselView * rankingCarouselView = [RankingCarouselView new];
    [rankingCarouselView setRankingDataSources:self.presenter.getLeaderboardDataSource];
    rankingCarouselView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.carouselContainerView addSubview:rankingCarouselView];
    [rankingCarouselView fitToParentView:self.carouselContainerView];
}

#pragma mark - RankingSwitchView

#pragma mark - RankingSwitchViewDataSource

- (nonnull UIColor *)textColor {
    
    return [UIColor defaultTextColor];
}

- (nonnull UIColor *)colorInHighlightState {
    
    return [UIColor defaultTextColor];
}

- (nonnull UIColor *)textColorInNormalState {
    
    return [UIColor defaultTextColor];
}

- (nonnull UIColor *)textColorInHighlightState {
    
    return [UIColor defaultTextColor];
}

#pragma mark  RankingSwitchViewDataSource

- (void)clickedLocalRakingButton:(nonnull UIButton *)sender {
    
}

- (void)clickedMarketRankingButton:(nonnull UIButton *)sender {
    
}

@end
