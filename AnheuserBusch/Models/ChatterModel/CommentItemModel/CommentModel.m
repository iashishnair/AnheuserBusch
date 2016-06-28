//
//  CommentModel.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "CommentModel.h"
#import "CommentItemModel.h"
#import "SalesForceChatterHelper.h"
#import "ActorDataModel.h"

@interface CommentModel ()

@property (nonatomic, strong) NSString *parentFeedID;
@property (nonatomic, strong) NSArray <CommentItemModel*> *feedCommentItems;

@end

@implementation CommentModel


- (instancetype)initWithCommentParentFeedID:(NSString *)parentFeedID
                          feedCommentItems:(NSArray *)feedCommentsItems {
    
    if (self == [super init]) {
        
        self.parentFeedID = parentFeedID;
        self.feedCommentItems = [self populateCommentItemModel:feedCommentsItems];
        
    }
    
    return self;
}

- (NSMutableArray *)populateCommentItemModel :(NSArray *)commentItems {
    
    NSMutableArray *comments = [NSMutableArray new];
    
    for (id obj in commentItems) {
     
        CommentItemModel *commentItemModel = [CommentItemModel new];
        commentItemModel.parentFeedID = self.parentFeedID ;
        commentItemModel.message = [SalesForceChatterHelper commentsItemBodyText:obj];
        [comments addObject:commentItemModel];
        

    }
    
    return comments;
}

@end
