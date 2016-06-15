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
 SOQLCompletion Status
 */
typedef enum {
    
    kSOQLStatusSucccess = 0,
    kSOQLStatusFailed = 1,
    kSOQLStatusCanceled = 2,
    kSOQLStatusTimedOut = 3,
    kSOQLStatusInvalidSOQL = 4,


} SOQLStatus;

/*!
 */
typedef enum {
    
//  kPageLogin = 0,
    kPageDashBoard = 0,
    kPageLeaderBoard = 1,

    
} PageIndex;

/*!
 Enum for RankingState
 */
typedef enum {
    
    RankingStateLocal = 0,
    RankingStateMarket = 1,

} RankingState;

/*!
 *  
 Sales Force
 */


typedef void(^SOQLCompletion) (id result, NSError *error, SOQLStatus status);

static NSString * const RemoteAccessConsumerKey = @"3MVG9ZL0ppGP5UrC1kvAlfnakx7n7NCoT7ZLCt.i2JNvdqGf7Bx9xV7piUSPLQyu_STFlMzYvQNpVFogsKOz2";
//@"3MVG9ZL0ppGP5UrBx59G805iIrQO.SNCi0UIe.UArEAE1Uf2WqNpXL9MADhanGQASNsczG8n_lgLs1oru52HG";
//static NSString * const OAuthRedirectURI        = @"sfdc://success";
static NSString * const OAuthRedirectURI        = @"sfdc://success";

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

static NSString * kName = @"Name";
static NSString * kRank = @"Rank";
static NSString * kSalesTarget = @"SalesTarget";

