//
//  PeerRankingDetailPresenter.m
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PeerRankingDetailPresenter.h"
#import "PeerRankingDataModel.h"

@implementation PeerRankingDetailPresenter

-(NSMutableArray *)peerRankingDetailDataSourcePopulate {
  
    NSMutableArray *results = [NSMutableArray array];
    
    
    
    for ( int i = 0 ; i < 20; i ++) {
        
        NSString *username = [NSString stringWithFormat:@"Emp:%d", i+1];
        PeerRankingDataModel *peerRankingDataModel = [PeerRankingDataModel new];
        peerRankingDataModel.userName = username;
        peerRankingDataModel.userRank = [NSString stringWithFormat:@"#%d",20-i];
        
        peerRankingDataModel.incentivePoints = [NSString stringWithFormat:@"%d",20*(i+1)];
        
        [results addObject:peerRankingDataModel];
    }
    
    
    return results;

    
}

@end
