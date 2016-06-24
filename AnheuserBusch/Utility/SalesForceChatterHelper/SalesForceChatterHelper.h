//
//  SalesForceChatterHelper.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Constants.h"

static NSString *kid = @"id";
static NSString *kBody = @"body";
static NSString *kActor = @"actor";
static NSString * kText = @"text";
static NSString *kComments = @"comments";
static NSString *kPage = @"page";
static NSString *kItems =  @"items";

@interface SalesForceChatterHelper : NSObject

+ (SalesForceChatterHelper *)shareInstance;
- (void)fetchChatterkFeedBack:(SOQLCompletion)completion;
- (void)fetchFeedLike:(NSString *)commentID completion:(SOQLCompletion)completion
;

- (void)likeAfeedElement:(NSString *)feedElementId
              completion:(PostMethodCompletion)completion;
- (void)postCommentOnAfeedElement:(NSString *)actorID
                      messageText:(NSString *)messageText
                       completion:(PostMethodCompletion)completion;
+ (id)actorElement:(id)element;
+ (id)commentsItems:(id)element;
+ (id)commentsItemBodyText:(id)element;
;@end
