//
//  KPIsDetailsDataModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPIsDetailsDataModel : NSObject

@property (strong, nonatomic) NSString *kpiName;
@property (strong, nonatomic) NSNumber *progress;
@property (strong, nonatomic) NSNumber *minRange;
@property (strong, nonatomic) NSNumber *maxRange;
@property (strong, nonatomic) NSString *progressUnit;

@end
