//
//  PeerRankingDetailPageCell.h
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeerRankingDataModel;

@interface PeerRankingDetailPageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsText;

-(void)updateCell:(PeerRankingDataModel *)peerRankingDataModel;

@end
