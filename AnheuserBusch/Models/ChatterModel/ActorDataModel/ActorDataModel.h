//
//  ActorDataModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActorDataModel : NSObject
- (instancetype)initWithElement:(NSDictionary *)element;
@property (nonatomic, strong) NSString *actorID;
@end
