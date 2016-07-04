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
#import "Constants.h"

@implementation ProfileViewPresenter

- (NSMutableArray *)incentiveDataSourcePopulate {
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource: @"ProfileDemo" ofType: @"plist"];
    NSMutableDictionary *dictplist =[[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    
    if(![NSDictionary isValidDictionary:dictplist]) return nil;
    
    NSArray *incentives = [dictplist valueForKeySafe:@"incentives"];
    
    if(!incentives || !incentives.count) return nil;
    
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];

    for (NSDictionary * obj in incentives) {
        
        IncentiveDataModel *incentiveDataModel = [IncentiveDataModel new];
        
        incentiveDataModel.rank = [obj valueForKeySafe:@"rank"];
        incentiveDataModel.incentiveName = [obj valueForKeySafe:@"incentivename"];
        incentiveDataModel.statusTitle = [obj valueForKeySafe:@"statusTitle"];
        incentiveDataModel.overAllIncentiveProgress = [obj valueForKeySafe:@"overAllIncentiveProgress"];
        incentiveDataModel.minIncentiveRange = [obj valueForKeySafe:@"minIncentiveRange"];
        incentiveDataModel.maxIncentiveRange = [obj valueForKeySafe:@"maxIncentiveRange"];
        incentiveDataModel.progressunit = [obj valueForKeySafe:@"progressunit"];

        [resultsArray addObject:incentiveDataModel];
    }
    
    return resultsArray;
}

@end
