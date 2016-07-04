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
#import "IncentivesProgressBarView.h"

@interface ProfilePageCustomCell ()

@property (weak, nonatomic) IncentiveDataModel *incentiveDataModel;
@property (strong, nonatomic) IncentivesProgressBarView * incentivesProgressBarView;

@end
@implementation ProfilePageCustomCell

- (void)dealloc {
    
    _incentivesProgressBarView = nil;
    
}

#pragma mark - Private Method

- (IncentivesProgressBarView *)incentivesProgressBarView {
    
    if(!_incentivesProgressBarView) {
        
        _incentivesProgressBarView = [IncentivesProgressBarView new];

        _incentivesProgressBarView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.chartView addSubview:_incentivesProgressBarView];
        [_incentivesProgressBarView fitToParentView:self.chartView];
    }
    
    return _incentivesProgressBarView;
}


#pragma mark - Public Method

-(void)updateCell:(IncentiveDataModel *)incentiveDataModel {
    
    if(!incentiveDataModel) return;
    
    self.incentiveDataModel = incentiveDataModel;
    
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
    
    if(self.chartView) {
        self.chartView.backgroundColor = [UIColor clearColor];
        
        self.incentivesProgressBarView.barBackGroundColor = [UIColor lightGrayColor];
        self.incentivesProgressBarView.progressColor = [UIColor greenColor];
        self.incentivesProgressBarView.minRange = self.incentiveDataModel.minIncentiveRange;
        self.incentivesProgressBarView.maxRange = self.incentiveDataModel.maxIncentiveRange;
        self.incentivesProgressBarView.progressAmount = self.incentiveDataModel.overAllIncentiveProgress;
        self.incentivesProgressBarView.unitName = @"point  ";
    }
}

#pragma mark - IB Action

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
