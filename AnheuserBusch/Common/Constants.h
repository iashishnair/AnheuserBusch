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

typedef struct {
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
}ColorRGBModelStruct;

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


typedef void(^SOQLCompletion) (id result, NSError *error, SOQLStatus status);
typedef void(^PostMethodCompletion) (NSError *error, SOQLStatus status);


/*!
 Page details
 */
typedef enum {
    
//  kPageLogin = 0,
    kPageProfile = 0,
    kPageOverAllRanking = 1,
    kPageChatter = 2,
	kPageHelp_Support = 3,
	kLogout = 4,
} PageIndex;


#define MenuItems @[@"Profile", @"Overall Ranking", @"Chatter", @"Help and Support", @"Logout"]

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
#define kOnboardingIsShown  @"OnboardingIsShown"


static NSString * kClassNameLoginViewController = @"LoginViewController";
static NSString * kClassNameLeaderBoardViewController = @"LeaderBoardViewController";
static NSString * kClassNameDashBoardViewController = @"DashBoardViewController";

//StoryBoard ID
static NSString * kStoryBoardIDPeerRankingDetailViewController = @"PeerRankingDetailViewController";
static NSString * kStoryBoardIDKPIRankingViewController = @"KPIRankingViewController";
static NSString * kStoryBoardIDAnnouncementsViewController = @"AnnouncementsViewController";


//
static NSString * kPageTitleLoginViewController = @"LoginView";
static NSString * kPageTitleLeaderBoardViewController = @"LeaderBoard";
static NSString * kPageTitleDashBoardViewController = @"DashBoard";

static NSString * kName = @"Name";
static NSString * kRank = @"Rank";
static NSString * kSalesTarget = @"SalesTarget";

// Dashboard View Controller Label Text

static NSString * achievmentsLabelText = @"  Achievments This week ?";
static NSString * taskTableHeading = @"My Tasks For This Week";

//Peer Ranking Details View Controller

static NSString * viewHeading = @"Overall KPI ranking";


