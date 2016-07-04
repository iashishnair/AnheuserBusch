//
//  ProfileDataModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileDataModel : NSObject

@property (strong, nonatomic) NSString *profileUserName;
@property (strong, nonatomic) NSNumber *rank;
@property (strong, nonatomic) NSNumber *incentiveName;
@property (strong, nonatomic) NSNumber *overAllIncentiveProgress;
@property (strong, nonatomic) NSNumber *minIncentiveRange;
@property (strong, nonatomic) NSNumber *maxIncentiveRange;
@property (strong, nonatomic) NSString *progressunit;

@property (strong, nonatomic) NSArray *kpisDetails;
@property (strong, nonatomic) NSArray *peerDetails;


@end
