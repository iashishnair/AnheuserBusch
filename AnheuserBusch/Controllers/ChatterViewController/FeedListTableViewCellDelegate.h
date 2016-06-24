//
//  FeedListTableViewCellDelegate.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedDataModel.h"

@protocol FeedListTableViewCellDelegate <NSObject>

- (void)clickedLikeButton:(nonnull UIButton *)sender feedDataModel:(nonnull FeedDataModel *)feedDataModel;
- (void)clickedCommentButton:(nonnull UIButton *)sender feedDataModel:(nonnull FeedDataModel *)feedDataModel;

@end
