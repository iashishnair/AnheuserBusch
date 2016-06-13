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

@interface RankingCarouselView ()


@end

@implementation RankingCarouselView




#pragma mark - Private Method

- (void)reloadUserRankView:(LeaderBoardDataModel *)leaderBoardDataModel userRankView:(UserRankView *)userRankView {
	
	userRankView.userImageURLString =  [leaderBoardDataModel userImageURLString];
	userRankView.userRank =  [leaderBoardDataModel userRank];
	userRankView.userName =  [leaderBoardDataModel userName];
	userRankView.userSelesTagetAmount =  [NSString stringWithFormat:@"%.2f",[[leaderBoardDataModel userSalesTargetAmount] doubleValue]] ;
}

#pragma mark - Public Method

- (void)setRankingDataSources:(nullable NSArray <LeaderBoardDataModel *> *)rankingDataSources {
	
	_rankingDataSources = rankingDataSources;
    
    NSMutableString *xContsrains = [NSMutableString stringWithString:@"H:|"];

    NSMutableDictionary *views =[NSMutableDictionary dictionary];

		for (int i = 0 ; i < _rankingDataSources.count; i++) {
			
            if(i>2)
                break;
            
			LeaderBoardDataModel *leaderBoardDataModel = _rankingDataSources[i];
			UserRankView *userRankView = [UserRankView loadViewFromNIB];
            userRankView.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:userRankView];

            NSString *userRankViewName = [NSString stringWithFormat:@"userRankView_%d",i+1];
            
            [views setObject:userRankView forKey:userRankViewName];
            
            [xContsrains appendString:[NSString stringWithFormat:@"-10-[%@(100)]",userRankViewName]];
           
            NSString *yContsrains = [NSString stringWithFormat:@"V:|[%@]|",userRankViewName];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:yContsrains options:0 metrics:nil views:views]];
            
            
            [self reloadUserRankView:leaderBoardDataModel userRankView:userRankView];
		}
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:xContsrains options:0 metrics:nil views:views]];
    

    
	}
	
	

#pragma mark - Private Method
@end
