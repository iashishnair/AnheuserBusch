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
@property (assign, nonatomic, readwrite) NSUInteger index;

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

-(void)updateCell:(IncentiveDataModel *)incentiveDataModel atIndex:(NSUInteger)index{
    
    _index = index;
    
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
        self.incentivesProgressBarView.layer.cornerRadius = 3;
        self.incentivesProgressBarView.clipsToBounds = YES;
    }
}

#pragma mark - IB Action

- (IBAction)clickedPeerRanking:(UIButton *)sender atIndex:(NSUInteger)index {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedPeerRanking:atIndex:)]) {
        
        [self.delegate clickedPeerRanking:sender atIndex:self.index];
    }
}

- (IBAction)clickedKPIRanking:(UIButton *)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedKPIRanking:atIndex:)]) {
        
        [self.delegate clickedKPIRanking:sender atIndex:self.index];
    }
}


@end
