//
//  WorkProfileViewPresenter.m
//  AnheuserBusch
//
//  Created by MM-iMac on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "WorkProfileViewPresenter.h"
#import "WorkProfileDataModel.h"

@implementation WorkProfileViewPresenter

-(WorkProfileDataModel *)populateWorkProfileDataSource {
    
    WorkProfileDataModel *dataModel = [WorkProfileDataModel new];
    
    dataModel.Rank = @"#2";
    dataModel.Name = @"John Peterson";
    dataModel.hi5BadgeNumber = @"1";
    dataModel.firstIncentiveBadgeNumber = @"4";
    dataModel.secondIncentiveBadgeNumber =@"1";
    dataModel.IncentiveSubgroupHeading = @"Large Format";
    dataModel.IncentiveSubgroupRank = @"#6";
    dataModel.IncentiveSubgroupPoints = @"55 points";
    dataModel.IncentiveSubgroupAmount = @"$320,541.00";
    dataModel.IncentiveSubgroupPercentage = @"92%";
    
    //_badgesView.badgesDataModel = dataModel;
    return dataModel;
    
}

@end
