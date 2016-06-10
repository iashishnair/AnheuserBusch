//
//  RankingCarouselView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "RankingCarouselView.h"
#import "NSObject+HelperUtil.h"
#import "UserRankView.h"
#import "LeaderBoardDataModel.h"

@implementation RankingCarouselView


- (instancetype) init {
	
	
	if(self = [super init]) {
		
		
	}
	
	return self;
	
}

#pragma mark - Private Method

- (void)reloadUserRankView:(LeaderBoardDataModel *)leaderBoardDataModel userRankView:(UserRankView *)userRankView {
	
	userRankView.userImageURLString =  [leaderBoardDataModel userImageURLString];
	userRankView.userRank =  [leaderBoardDataModel userRank];
	userRankView.userName =  [leaderBoardDataModel userName];
	userRankView.userSelesTagetAmount =  [leaderBoardDataModel userSelesTagetAmount];
}

#pragma mark - Public Method

- (void)setRankingDataSources:(nullable NSArray <LeaderBoardDataModel *> *)rankingDataSources {
	
	_rankingDataSources = rankingDataSources;
	
		for (int i = 0 ; i < _rankingDataSources.count; i++) {
			
			LeaderBoardDataModel *leaderBoardDataModel = _rankingDataSources[i];
			UserRankView *userRankView = [UserRankView loadViewFromNIB];
			[self reloadUserRankView:leaderBoardDataModel userRankView:userRankView];
			[self addSubview:userRankView];
		}
	}
	
	

#pragma mark - Private Method
@end
