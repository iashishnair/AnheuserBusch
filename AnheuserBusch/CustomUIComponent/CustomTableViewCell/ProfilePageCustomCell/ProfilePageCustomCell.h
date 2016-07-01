//
//  ProfilePageCustomCell.h
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProfilePageCustomCellDelegate <NSObject>

@optional
- (void)clickedPeerRanking:(UIButton *)sender;
- (void)clickedKPIRanking:(UIButton *)sender;

@end

@class IncentiveDataModel;

@interface ProfilePageCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *IncentiveLogo;
@property (weak, nonatomic) IBOutlet UILabel *IncentiveName;
@property (weak, nonatomic) IBOutlet UILabel *RankLabel;
@property (weak, nonatomic) IBOutlet UIImageView *RankImage;
@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *statusTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *peerRankingButton;
@property (weak, nonatomic) IBOutlet UIButton *kPIDetailsButton;
@property (weak, nonatomic) IBOutlet UILabel *rankNumber;
@property (nonatomic, weak) id <ProfilePageCustomCellDelegate> delegate;

-(void) updateCell :(IncentiveDataModel *)incentiveDataModel;

@end
