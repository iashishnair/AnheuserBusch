//
//  SalesForceSOQL.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 13/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SalesForceSOQL : NSObject

+ (nonnull SalesForceSOQL *)shareInstance;

- (void)getDetailsWithSOQL:(nonnull NSString *)soqlString completion:(nullable SOQLCompletion)completion;
- (void)getUserDetails:(nullable SOQLCompletion)completion;
- (void)userDetails:(nullable SOQLCompletion)completion ;

@end
