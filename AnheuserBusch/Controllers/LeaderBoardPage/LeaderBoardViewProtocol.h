//
//  LeaderBoardViewProtocol.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 13/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LeaderBoardViewProtocol <NSObject>

- (void) getUserDataDetails:(void(^)(NSArray * results))completion;
- (nullable NSArray *) getLeaderboardDataSource;
@end
