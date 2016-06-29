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
            self.fullName = [NSObject objectForKeySafe:actorDict key:@"name"];
            self.imageURLString = [NSObject objectForKeySafe:actorDict key:@"id"];

            
            if(actorDict && [actorDict valueForKey:@"photo"]) {
               
                self.actorPhotoDataModel  = [ActorPhotoDataModel new];
                [ self.actorPhotoDataModel setActorPhotoDict:[actorDict valueForKey:@"photo"]];
            }
        }
    }
    
    return self;
}



@end



@implementation ActorPhotoDataModel

- (void)setActorPhotoDict:(NSDictionary *)actorPhotoDict {
    
    _actorPhotoDict = actorPhotoDict;
    
    if(_actorPhotoDict) {
        
        self.standardEmailPhotoUrl = _actorPhotoDict[@"fullEmailPhotoUrl"];
    }
    
}

@end