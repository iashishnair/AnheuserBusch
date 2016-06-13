//
//  LeaderBoardViewControllerPresenter.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 13/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "LeaderBoardViewControllerPresenter.h"
#import "Constants.h"
#import "LeaderBoardDataModel.h"

@implementation LeaderBoardViewControllerPresenter

#pragma mark - Public Method 

- (nullable NSArray *) getLeaderboardDataSource
{
    NSMutableArray *results = [NSMutableArray array];
    
    
    for ( int i = 0 ; i < 20; i ++) {
       
        NSString *username = [NSString stringWithFormat:@"Emp:%d", i+1];
        double target = (i+1) * (2378.22* 3.33);

        LeaderBoardDataModel *leaderBoardDataModel = [LeaderBoardDataModel new];
        leaderBoardDataModel.userName = username;
        leaderBoardDataModel.userRank = [NSString stringWithFormat:@"#%d",20-i];

        leaderBoardDataModel.userSalesTargetAmount = @(target);
        [results addObject:leaderBoardDataModel];
    }
    
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                       sortDescriptorWithKey:@"userSalesTargetAmount"
                                       ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:dateDescriptor];
    NSArray *sortedEventArray = [results
                                 sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedEventArray;
}


@end
