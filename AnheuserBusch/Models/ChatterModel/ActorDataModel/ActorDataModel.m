//
//  ActorDataModel.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ActorDataModel.h"

@implementation ActorDataModel

- (instancetype)initWithElement:(NSDictionary *)element {
    
    if (self == [super init]) {
        
        if(element) {
           
            self.actorID = element[@"id"];
        }
    }
    
    return self;
}



@end
