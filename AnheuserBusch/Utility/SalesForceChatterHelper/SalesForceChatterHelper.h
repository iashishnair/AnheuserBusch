//
//  SalesForceChatterHelper.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SalesForceChatterHelper : NSObject

+ (SalesForceChatterHelper *)shareInstance;
- (void)fetchChatterkFeedBack:(SOQLCompletion)completion;
- (void)fetchFeedLike:(NSString *)commentID completion:(SOQLCompletion)completion
;
@end
