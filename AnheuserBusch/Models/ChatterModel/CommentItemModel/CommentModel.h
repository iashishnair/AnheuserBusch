//
//  CommentModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (nonatomic, strong, readonly) NSString *parentFeedID;
@property (nonatomic, strong, readonly) NSArray *feedCommentItems;

- (instancetype)initWithCommentParentFeedID:(NSString *)parentFeedID
                           feedCommentItems:(NSArray *)feedCommentsItem;
@end
