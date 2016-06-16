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
#import "LeaderBoardCustomCell.h"
#import "LeaderBoardDataModel.h"

@interface LeaderBoardViewController () <RankingSwitchViewDelegate,
RankingSwitchViewDataSource, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *weekelyLabel;
@property (weak, nonatomic) IBOutlet UIButton *calenderButton;
@property (weak, nonatomic) IBOutlet UIView *rakingSwitchContainerView;
@property (weak, nonatomic) IBOutlet UIView *salesTargetDropDownContainerView;
@property (weak, nonatomic) IBOutlet UIView *carouselContainerView;
@property (weak, nonatomic) IBOutlet UITableView *leaderBoardListTableview;
@property (weak, nonatomic) IBOutlet UIButton *SalesTargetButton;


@property (strong, nonatomic) id <LeaderBoardViewProtocol> presenter;

@property (strong, nonatomic) NSMutableArray *firstThreeDataSource;
@property (strong, nonatomic) NSMutableArray *leaderBoardListDataSource;

@end

@implementation LeaderBoardViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
	[self createDataSource];
	[self configureUI];
	
	[self.leaderBoardListTableview reloadData];
	
	
}

#pragma mark - Private Method
	//???: Need Optimize
- (void)createDataSource {
	
	NSArray * fullDataSource = [self.presenter getLeaderboardDataSource];
	
	_firstThreeDataSource = [NSMutableArray array];
	self.leaderBoardListDataSource = [NSMutableArray array];
	NSMutableArray *firstThreeDataSourceLocal = [NSMutableArray array];
	
	
	NSUInteger idx = 0;
	
	for (id  _Nonnull obj in fullDataSource) {
		
		if(obj) {
			
			if(idx<3) {
				
				[firstThreeDataSourceLocal addObject:obj];
				
			} else {
				[_leaderBoardListDataSource addObject:obj];
				
			}
			
			idx +=1;
			
			
		}
		
		if(firstThreeDataSourceLocal.count > 2 && _firstThreeDataSource.count < 4) {
			
			[_firstThreeDataSource addObject:firstThreeDataSourceLocal[1]];
			[_firstThreeDataSource addObject:firstThreeDataSourceLocal[0]];
			[_firstThreeDataSource addObject:firstThreeDataSourceLocal[2]];
			
		} else  {
			
			_firstThreeDataSource = firstThreeDataSourceLocal;
		}
		
	}
	
}
	//MARK: Getter Method

- (id <LeaderBoardViewProtocol>)presenter {
	
	if(!_presenter) {
		
		_presenter = [LeaderBoardViewControllerPresenter new];
	}
	
	return _presenter;
}


	// UI
- (void)configureUI {
	
	self.view.backgroundColor = [UIColor defaultPageBGColor];
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
	[rankingCarouselView setRankingDataSources:_firstThreeDataSource];
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


#pragma mark- table view delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return self.leaderBoardListDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"myCell";
	
	
	LeaderBoardCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		[tableView registerNib:[UINib nibWithNibName:@"LeaderBoardCustomCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
		
		cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	}
	
	if (self.leaderBoardListDataSource.count && self.leaderBoardListDataSource.count > indexPath.row) {
		
		LeaderBoardDataModel *leaderBoardDataModel = [self.leaderBoardListDataSource objectAtIndex:indexPath.row];
		
		[cell reloadCell:leaderBoardDataModel];
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}


@end
