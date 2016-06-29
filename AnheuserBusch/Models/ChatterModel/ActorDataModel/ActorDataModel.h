//
//  ActorDataModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 24/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActorPhotoDataModel : NSObject

@property (nonatomic, strong) NSDictionary *actorPhotoDict;

@property (nonatomic, strong) NSString *standardEmailPhotoUrl;
@property (nonatomic, strong) NSString *photoVersionId;
@property (nonatomic, strong) NSString *smallPhotoUrl;

@end

@interface ActorDataModel : NSObject

- (instancetype)initWithElement:(NSDictionary *)element;


@property (nonatomic, strong) NSString *actorID;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *imageURLString;
@property (nonatomic, strong) ActorPhotoDataModel *actorPhotoDataModel;


@end




