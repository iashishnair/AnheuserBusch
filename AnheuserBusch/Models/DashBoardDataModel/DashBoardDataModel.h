//
//  DashBoardDataModel.h
//  AnheuserBusch
//
//  Created by MM-iMac on 15/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DashBoardDataModel : NSObject

@property (strong, nonatomic) NSString *taskTitle;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *taskDate;
@property (assign, nonatomic) BOOL *workStatus;

@end
