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
    
    [[self.peerRankingButton layer] setBorderWidth:1.5f];
    self.peerRankingButton.layer.borderColor = [UIColor blueColorABI].CGColor ;
    self.peerRankingButton.backgroundColor = [UIColor whiteColor];
    self.kPIDetailsButton.backgroundColor = [UIColor blueColorABI];
    self.peerRankingButton.layer.cornerRadius = 3; // this value vary as per your desire
    self.peerRankingButton.clipsToBounds = YES;
    self.kPIDetailsButton.layer.cornerRadius = 3; // this value vary as per your desire
    self.kPIDetailsButton.clipsToBounds = YES;
    [self configureUI];
    
    //[self.peerRankingButton layer]s
    
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
    
//    //
    
    NSString *statusDescription = incentiveDataModel.statusDescription;
    
    if(![NSString isNULLString:statusDescription]) {
        self.statusTitleLabel .text = statusDescription;
    }
    
    if(self.chartView) {
		
        self.incentivesProgressBarView.barBackGroundColor = [UIColor lightGreyColorABI];
        self.incentivesProgressBarView.progressColor = [UIColor greenColor];
        self.incentivesProgressBarView.minRange = self.incentiveDataModel.minIncentiveRange;
        self.incentivesProgressBarView.maxRange = self.incentiveDataModel.maxIncentiveRange;
        self.incentivesProgressBarView.progressAmount = self.incentiveDataModel.overAllIncentiveProgress;
        self.incentivesProgressBarView.unitName = self.incentiveDataModel.progressUnit;
        self.incentivesProgressBarView.unitTextFont = [UIFont boldSystemFontOfSize:16];
        self.incentivesProgressBarView.descriptionTextColor = [UIColor blackColor];
        self.incentivesProgressBarView.descriptionTextFont = [UIFont systemFontOfSize:12];

        NSString *statusTitle = incentiveDataModel.statusTitle;
        if(![NSString isNULLString:statusTitle]) {
            self.incentivesProgressBarView.descriptionText = statusTitle;
        }
    }
}

-(void)configureUI {
    
    self.IncentiveName.font =  INCENTIVE_NAME_FONT_SIZE;
    self.statusTitleLabel.font = STATUS_TITLE_FONT_SIZE;
    
    [[self.peerRankingButton layer] setBorderWidth:1.5f];
    self.peerRankingButton.layer.borderColor = [UIColor defaultABIThemeBlueColor].CGColor ;
    self.peerRankingButton.backgroundColor = [UIColor whiteColor];
    self.kPIDetailsButton.backgroundColor = [UIColor blueColorABI];
    self.peerRankingButton.layer.cornerRadius = 3; // this value vary as per your desire
    self.peerRankingButton.clipsToBounds = YES;
    self.kPIDetailsButton.layer.cornerRadius = 3; // this value vary as per your desire
    self.kPIDetailsButton.clipsToBounds = YES;
    
    [self.peerRankingButton setTitleColor:[UIColor defaultABIThemeBlueColor] forState:UIControlStateNormal];
    [self.kPIDetailsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
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
