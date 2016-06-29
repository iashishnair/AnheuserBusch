//
//  PeerRankingDetailPageCell.m
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PeerRankingDetailPageCell.h"
#import "PeerRankingDataModel.h"

@implementation PeerRankingDetailPageCell

#pragma mark - Public Method 

-(void)updateCell:(PeerRankingDataModel *)peerRankingDataModel {
    
    if(!peerRankingDataModel)
        return;
    
    if(peerRankingDataModel.userRank)
    {
        NSString *rank = peerRankingDataModel.userRank;
        self.rankLabel.text = rank;
    }
    if(peerRankingDataModel.userName)
    {
        NSString *userName = peerRankingDataModel.userName;
        
        self.nameLabel.text = userName;
        
    }
    if(peerRankingDataModel.incentivePoints)
    {
        NSString *incentivePoints = peerRankingDataModel.incentivePoints;
        self.pointsLabel.text = incentivePoints;
    }
    
    
}

@end
