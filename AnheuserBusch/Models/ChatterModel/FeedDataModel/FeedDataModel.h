//
//  FeedDataModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"
#import "ActorDataModel.h"

@interface FeedDataModel : NSObject

@property (nonatomic, strong) NSString *feedID;
@property (nonatomic, strong) NSString *feedMessage;
@property (nonatomic, strong) id element;
@property (nonatomic, strong) CommentModel *commentModel;
@property (nonatomic, strong) ActorDataModel *actorDataModel;

@end
