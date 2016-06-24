//
//  ActorDataModel.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ActorDataModel.h"
#import "Constants.h"
#import "SalesForceChatterHelper.h"

@implementation ActorDataModel

- (instancetype)initWithElement:(NSDictionary *)element {
    
    if (self == [super init]) {
        
        if(element) {
           
            NSDictionary *actorDict = [SalesForceChatterHelper actorElement:element];
            
            self.actorID = [NSObject objectForKeySafe:actorDict key:@"id"];
        }
    }
    
    return self;
}



@end
