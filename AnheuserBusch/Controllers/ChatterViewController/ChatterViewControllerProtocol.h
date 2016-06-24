//
//  ChatterViewControllerProtocol.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@protocol ChatterViewControllerProtocol <NSObject>

- (void)fetchChatterkFeedBack:(void(^)(NSArray * results))completion;



- (void)postAFeed:(NSString *)feedElementId
                      messageText:(NSString *)messageText
                       completion:(PostMethodCompletion)completion;

- (void)likeAFeed:(NSString *)feedElementId
	   completion:(PostMethodCompletion)completion;

- (void)postCommentOnAfeed:(NSString *)feedID
			   messageText:(NSString *)messageText
				completion:(PostMethodCompletion)completion;
@end
