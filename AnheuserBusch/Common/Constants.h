//
//  Constants.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HelperUtil.h"
#import "UIView+Common.h"
/*!
 Enum for RankingState
 */
typedef enum {
    
    RankingStateLocal = 0,
    RankingStateMarket = 1,

} RankingState;

/*!
 *  Class name
 */

static NSString * kClassNameLoginViewController = @"LoginViewController";
static NSString * kClassNameLeaderBoardViewController = @"LeaderBoardViewController";
static NSString * kClassNameDashBoardViewController = @"DashBoardViewController";

//
static NSString * kPageTitleLoginViewController = @"LoginView";
static NSString * kPageTitleLeaderBoardViewController = @"LeaderBoard";
static NSString * kPageTitleDashBoardViewController = @"DashBoard";