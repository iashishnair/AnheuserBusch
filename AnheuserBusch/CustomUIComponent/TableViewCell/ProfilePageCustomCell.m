//
//  ProfilePageCustomCell.m
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ProfilePageCustomCell.h"
#import "IncentiveDataModel.h"

@implementation ProfilePageCustomCell

-(void) updateCell :(IncentiveDataModel *)incentiveDataModel {
    
    if(incentiveDataModel.incentiveName)
    {
        NSString *incentiveName =incentiveDataModel.incentiveName;

        self.IncentiveName.text = incentiveName;
    }
    
    self.RankLabel.text = @"Rank";

    
    if(incentiveDataModel.rank)
    {
        NSString *rank = incentiveDataModel.rank;
        self.rankNumber.text = rank;
          }
    
    if(incentiveDataModel.statusTitle)
    {
        NSString *status = incentiveDataModel.statusTitle;
        self.statusTitleLabel.text = status;
    }
    
    if(incentiveDataModel.statusDescription)
    {
        NSString *description = incentiveDataModel.statusDescription;
        self.statusDescriptionLabel.text = description;
    }
}

@end
