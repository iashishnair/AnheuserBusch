//
//  NSObject+HelperUtil.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "NSObject+HelperUtil.h"

@implementation NSObject (HelperUtil)

+ (void)performInMainThreadAfterDelay:(NSTimeInterval)delayInterval
                          completion:(void(^)(void))completion {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    if(completion)
        completion ();
    });
}
@end
