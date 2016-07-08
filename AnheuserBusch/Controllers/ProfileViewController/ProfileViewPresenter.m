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
#import "KPIsDetailsDataModel.h"

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
        incentiveDataModel.statusDescription = [obj valueForKeySafe:@"statusDescription"];
        incentiveDataModel.statusTitle = [obj valueForKeySafe:@"statusTitle"];
        incentiveDataModel.overAllIncentiveProgress = [obj valueForKeySafe:@"overAllIncentiveProgress"];
        incentiveDataModel.minIncentiveRange = [obj valueForKeySafe:@"minIncentiveRange"];
        incentiveDataModel.maxIncentiveRange = [obj valueForKeySafe:@"maxIncentiveRange"];
        incentiveDataModel.progressUnit = [obj valueForKeySafe:@"progressunit"];
        
        
        NSMutableArray *kpis = [self populateKPIS:[obj valueForKeySafe:@"kpis"]];
        
        if(kpis.count)
            incentiveDataModel.kpisDetails = kpis;
        
        [resultsArray addObject:incentiveDataModel];
    }
    
    return resultsArray;
}

-(ProfilePageDataModel *)profileInfoPopulate {
    
    ProfilePageDataModel *dataModel = [ProfilePageDataModel new];
    dataModel.userName = @"Jack Peterson";
    
    return dataModel;
}

- (NSMutableArray *)populateKPIS:(NSArray *) kpiDetails {
    
    NSMutableArray *kpis = [NSMutableArray array];
    
    for (NSDictionary * kip in kpiDetails) {
        
        KPIsDetailsDataModel *kpisDetailsDataModel  = [KPIsDetailsDataModel new];
        kpisDetailsDataModel.kpiName = [kip valueForKeySafe:@"name"];
        kpisDetailsDataModel.maxRange = [kip valueForKeySafe:@"maxprogress"];
        kpisDetailsDataModel.minRange = [kip valueForKeySafe:@"minprogress"];
        kpisDetailsDataModel.progress = [kip valueForKeySafe:@"progress"];
        kpisDetailsDataModel.progressUnit = [kip valueForKeySafe:@"progressunit"];
        [kpis addObject:kpisDetailsDataModel];
        
        
    }
    return kpis;
}



@end
