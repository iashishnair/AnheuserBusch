//
//  ProfileViewPresenter.m
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ProfileViewPresenter.h"
#import "ProfileViewProtocol.h"
#import "IncentiveDataModel.h"

@implementation ProfileViewPresenter

-(NSMutableArray *)incentiveDataSourcePopulate {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    for(int i = 0;i<10;i++)
    {
    IncentiveDataModel *dataModel = [IncentiveDataModel new];
    dataModel.rank = [NSString stringWithFormat:@"%d",i+1];;
    dataModel.incentiveName = [NSString stringWithFormat:@"Incentive %d",i+1];
        dataModel.statusTitle = @"Way to Go !!!";
        dataModel.statusDescription = @"Out of 15 KPIs you have achieved 12";
       [resultsArray addObject:dataModel];
    }
    return resultsArray;
}

@end
