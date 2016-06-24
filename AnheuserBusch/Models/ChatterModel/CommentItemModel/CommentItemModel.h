//
//  CommentItemModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentItemModel : NSObject

@property (nonatomic, strong) NSString *parentFeedID;
@property (nonatomic, strong) NSString *commentItemModelID;
@property (nonatomic, strong) NSString *message;

@end
