//
//  WorkProfileViewProtocol.h
//  AnheuserBusch
//
//  Created by MM-iMac on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkProfileDataModel.h"

@protocol WorkProfileViewProtocol <NSObject>

-(WorkProfileDataModel *)populateWorkProfileDataSource;

@end
