//
//  FeedListCell.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedListTableViewCellDelegate.h"

@class FeedDataModel;
@class CommentItemModel;

@interface FeedListTableViewCell : UITableViewCell

@property (nonatomic, strong) FeedDataModel *feedDataModel;
@property (nonatomic, strong) CommentItemModel *commentItemModel;
@property (nonatomic, weak) id <FeedListTableViewCellDelegate> delegate;
- (void)updateFeed ;
- (void)updateFeedComments ;

@end
