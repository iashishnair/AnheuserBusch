//
//  FeedDataModel.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "FeedDataModel.h"
#import "CommentItemModel.h"
#import "SalesForceChatterHelper.h"


@implementation FeedDataModel


- (void)setElement:(id)element {
    
    _element = element;
    
    if(!_element) return;
    
    NSArray * feedCommentItems = [SalesForceChatterHelper commentsItems:_element];

    self.commentModel = [[CommentModel alloc]initWithCommentParentFeedID:self.feedID feedCommentItems:feedCommentItems];
    
    self.actorDataModel  = [[ActorDataModel alloc]initWithElement:_element];
}
@end
