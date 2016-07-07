//
//  CStorePLTableViewCell.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncentivesProgressBarView.h"

@interface CStorePLTableViewCell : UITableViewCell

@property (nonatomic, strong) IncentivesProgressBarView *incentiveBarChartView;
@property (nonatomic, strong) NSString *kpiName;

@end
