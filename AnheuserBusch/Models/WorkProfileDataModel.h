//
//  WorkProfileDataModel.h
//  AnheuserBusch
//
//  Created by MM-iMac on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkProfileDataModel : NSObject

@property (nonatomic, strong) NSString *Rank;
@property (nonatomic, strong) NSString *Name;
@property (nonatomic, strong) NSString *hi5BadgeNumber;
@property (nonatomic, strong) NSString *hi5BadgeImageURLString;
@property (nonatomic, strong) NSString *firstIncentiveBadgeNumber;
@property (nonatomic, strong) NSString *firstIncentiveBadgeImageURLString;
@property (nonatomic, strong) NSString *secondIncentiveBadgeNumber;
@property (nonatomic, strong) NSString *secondIncentiveBadgeImageURLString;
@property (nonatomic, strong) NSString *IncentiveSubgroupHeading;
@property (nonatomic, strong) NSString *IncentiveSubgroupRank;
@property (nonatomic, strong) NSString *IncentiveSubgroupPoints;
@property (nonatomic, strong) NSString *IncentiveSubgroupAmount;
@property (nonatomic, strong) NSString *IncentiveSubgroupPercentage;

@end
