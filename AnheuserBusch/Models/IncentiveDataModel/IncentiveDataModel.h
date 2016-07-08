//
//  IncentiveDataModel.h
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncentiveDataModel : NSObject

@property (strong, nonatomic) NSString *profileUserName;
@property (strong, nonatomic) NSString *rank;
@property (strong, nonatomic) NSString *incentiveName;
@property (strong, nonatomic) NSNumber *overAllIncentiveProgress;
@property (strong, nonatomic) NSNumber *minIncentiveRange;
@property (strong, nonatomic) NSNumber *maxIncentiveRange;
@property (strong, nonatomic) NSString *progressUnit;
@property (strong, nonatomic) NSString *statusTitle;
@property (strong, nonatomic) NSString *statusDescription;


@property (strong, nonatomic) NSArray *kpisDetails;
@property (strong, nonatomic) NSArray *peerDetails;
@end
