//
//  DashBoardViewControllerPresenter.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 15/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "DashBoardViewControllerPresenter.h"
#import "DashBoardDataModel.h"

@implementation DashBoardViewControllerPresenter

#pragma mark - Public Methods

- (NSMutableArray *)getDashBoardDataSource {
    
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];

    for(int i = 0;i < 25 ;i++)
    {
        DashBoardDataModel *dashBoardDataModel = [[DashBoardDataModel alloc]init];
        dashBoardDataModel.taskTitle = [NSString stringWithFormat:@"Title:%d", i+1];
        dashBoardDataModel.taskDescription = [NSString stringWithFormat:@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years"];
        dashBoardDataModel.taskDate = [NSString stringWithFormat:@"%d JUN", i+1];
        if(i<10)
        {
            dashBoardDataModel.workStatus = YES;
        }
        else
        {
            dashBoardDataModel.workStatus = NO;
        }
        [resultsArray addObject:dashBoardDataModel];
        
    }
    
    return resultsArray;
}

@end
