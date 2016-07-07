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
#import "NSLayoutConstraint+LayoutConstraintHelper.h"

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



//StoryBoard ID
static NSString * kStoryBoardIDPeerRankingDetailViewController = @"PeerRankingDetailViewController";
static NSString * kStoryBoardIDKPIRankingViewController = @"KPIRankingViewController";
static NSString * kStoryBoardIDAnnouncementsViewController = @"AnnouncementsViewController";



static NSString * kName = @"Name";
static NSString * kRank = @"Rank";
static NSString * kSalesTarget = @"SalesTarget";

// Dashboard View Controller Label Text

static NSString * achievmentsLabelText = @"  Achievments This week ?";
static NSString * taskTableHeading = @"My Tasks For This Week";

//Peer Ranking Details View Controller

static NSString * viewHeading = @"Overall KPI ranking";


	//--------------------------- SLIDE MENU CONSTANT ---------------------------

//Font
#define SLIDE_MENU_SELECTED_LABEL_TEXT_FONT [UIFont systemFontOfSize:20]
#define SLIDE_MENU_DESELECTED_LABEL_TEXT_FONT [UIFont systemFontOfSize:20]
//Color
#define SLIDE_MENU_SEPERATOR_LINE_COLOR [UIColor redColor]

#define SLIDE_MENU_SELECTED_LABEL_TEXT_COLOR [UIColor darkGreyColorABI]
#define SLIDE_MENU_DESELECTED_LABEL_TEXT_COLOR [UIColor blueColorABI]

#define SLIDE_MENU_SELECTED_CELL_BG_COLOR [UIColor lightGreyColorABI]
#define SLIDE_MENU_DESELECTED_CELL_BG_COLOR [UIColor whiteColor]

	//--------------------------- HEX COLOR CODE ---------------------------

#define HEX_COLOR_CODE_0e71b9_BLUE   @"#0e71b9" //(14,113,185)
#define HEX_COLOR_CODE_7ad2f7_SKY   @"#7ad2f7" //(122,210,247)
#define HEX_COLOR_CODE_ffffff_WHITE   @"#ffffff"
#define HEX_COLOR_CODE_000000_BLACK  @"#000000"

#define HEX_COLOR_CODE_8dba00_GREEN  @"#8dba00" //(141,186,0)
#define HEX_COLOR_CODE_fe9611_ORANGE  @"#fe9611" //(254,150,17)
#define HEX_COLOR_CODE_f25957_OFFRED  @"#f25957" //(242,89,87)
#define HEX_COLOR_CODE_cccccc_DARK_GREY @"#333333" //(204,204,204)
#define HEX_COLOR_CODE_333333_LIGHTGREY  @"#cccccc" //(51,51,51)


