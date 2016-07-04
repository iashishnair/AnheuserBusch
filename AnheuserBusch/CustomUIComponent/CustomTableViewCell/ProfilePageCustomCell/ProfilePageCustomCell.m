//
//  ProfilePageCustomCell.m
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ProfilePageCustomCell.h"
#import "IncentiveDataModel.h"
#import "Constants.h"

@implementation ProfilePageCustomCell

-(void)updateCell:(IncentiveDataModel *)incentiveDataModel {
    
    
    if(!incentiveDataModel) return;
    
    self.RankLabel.text = @"Rank";
    
    NSString *incentiveName = incentiveDataModel.incentiveName;
    
    
    if(![NSString isNULLString:incentiveName]) {
        
        self.IncentiveName.text = incentiveName;
    }
    
    NSString *rank = incentiveDataModel.rank;
    
    if(![NSString isNULLString:rank]) {
        self.rankNumber.text = rank;
    }
    
    NSString *statusTitle = incentiveDataModel.statusTitle;
    
    if(![NSString isNULLString:statusTitle]) {
        self.statusTitleLabel.text = statusTitle;
    }
    
    NSString *statusDescription = incentiveDataModel.statusDescription;
    
    if(![NSString isNULLString:statusDescription]) {
        self.statusDescriptionLabel.text = statusDescription;
    }
}


- (IBAction)clickedPeerRanking:(UIButton *)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedPeerRanking:)]) {
        
        [self.delegate  clickedPeerRanking:sender];
    }
}


- (IBAction)clickedKPIRanking:(UIButton *)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedKPIRanking:)]) {
        
        [self.delegate  clickedKPIRanking:sender];
    }
}


@end
