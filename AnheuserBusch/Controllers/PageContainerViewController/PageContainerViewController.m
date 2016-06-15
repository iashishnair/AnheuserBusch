//
//  BaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PageContainerViewController.h"
#import "PageHeaderView.h"
#import "Constants.h"
#import "CustomSlideMenu.h"
#import "AppDelegate.h"

#import "LoginViewController.h"
#import "LeaderBoardViewController.h"
#import "DashBoardViewController.h"

#import <SalesforceSDKCore/SFPushNotificationManager.h>
#import <SalesforceSDKCore/SFDefaultUserManagementViewController.h>
#import <SalesforceSDKCore/SalesforceSDKManager.h>
#import <SalesforceSDKCore/SFUserAccountManager.h>
#import <SalesforceSDKCore/SFLogger.h>
#import <SmartStore/SalesforceSDKManagerWithSmartStore.h>
#import "SalesForceSOQL.h"

@interface PageContainerViewController () <PageHeaderViewDelegate, CustomSlideMenuDelegate,  CustomSlideMenuDataSource >

@property (strong, nonatomic) PageHeaderView *headerView;
@property (strong, nonatomic) CustomSlideMenu *customSlideMenu;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray *activeViewControllers;
@property (assign, nonatomic) NSUInteger currentPageIndex;
@property (strong, nonatomic) NSArray *menuDataSource;
@property (assign, nonatomic) BOOL isLogedIn;

@end

@implementation PageContainerViewController



#pragma mark - ViewController Life Cycle


- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if(self)  {
        
        self.isLogedIn = NO;
    }
    
    return self;
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configureUI];
    
    // Open It for Sales force Login
    // [self initialishedSalesForce];
    // [[SalesforceSDKManager sharedManager] launch];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //    [[SalesForceSOQL shareInstance]getUserDetails:^(id result, NSError *error, SOQLStatus status) {
    //
    //    }];
    
    //    [[SalesForceSOQL shareInstance]getSmallPhotoUrlURL:^(id result, NSError *error, SOQLStatus status) {
    //
    //    }];
}
#pragma mark - Private Method

- (void)configureUI {
    
    
    self.currentPageIndex = -1;
    [self.view addSubview:self.headerView];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    self.pageViewController.view.backgroundColor = [UIColor clearColor];
    [self moveToPageWithIndex:0];
    [self addConstrains];
    
}


- (UIView *)headerView {
    
    if(!_headerView) {
        
        _headerView = [PageHeaderView loadViewFromNIB];
        _headerView.delegate = self;
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    
    return _headerView;
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"headerView": self.headerView,
                            @"pageViewControllerView": self.pageViewController.view};
    
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[headerView]|" options:0 metrics:nil views:views]];
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewControllerView]|" options:0 metrics:nil views:views]];
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[headerView(44)][pageViewControllerView]|" options:0 metrics:nil views:views]];
    
}


- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if (([self.activeViewControllers count] == 0) || (index >= [self.activeViewControllers count])) {
        return nil;
    }
    
    
    UIViewController *activeViewController = nil;
    
    if(self.activeViewControllers && index < self.activeViewControllers.count) {
        
        activeViewController = [self.activeViewControllers objectAtIndex:index];
        
        [self.headerView setPageTitle:self.menuDataSource[index]];
        
    }
    
    return activeViewController ? activeViewController :  nil;
}


- (void)moveToPageWithIndex:(NSUInteger)pageIndex {
    
    if(self.currentPageIndex == pageIndex) return;
    
    UIViewController *selectedViewController = [self viewControllerAtIndex:pageIndex];
    
    if(selectedViewController) {
        
        NSArray *viewControllers = @[selectedViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
        self.currentPageIndex = pageIndex;
    }
    
}



// MARK: Getter Method

- (CustomSlideMenu *)customSlideMenu {
    
    if(!_customSlideMenu) {
        
        _customSlideMenu = [[CustomSlideMenu alloc] initWithWidth:150 andDirection:CustomSlideMenuDirectionLeftToRight];
        _customSlideMenu.dataSource = self;
        _customSlideMenu.delegate   = self;
        _customSlideMenu.backgroundColor = [UIColor defaultSeparatorColor];
        _customSlideMenu.textColor = [UIColor defaultTextColor];

    }
 
    return _customSlideMenu;
}

- (NSMutableArray *)activeViewControllers {
    
    if(!_activeViewControllers) {
        
        _activeViewControllers = [[NSMutableArray alloc]init];
        
        DashBoardViewController *dashBoardViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        dashBoardViewController.pageIndex = kPageDashBoard;
        
        [_activeViewControllers addObject:dashBoardViewController];
        
        LeaderBoardViewController *leaderBoardViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LeaderBoardViewController"];
        leaderBoardViewController.pageIndex = kPageLeaderBoard;
        
        [_activeViewControllers addObject:leaderBoardViewController];
    }
    
    return _activeViewControllers;
}

- (UIPageViewController *)pageViewController {
    
    if(!_pageViewController) {
        
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [_pageViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    return _pageViewController;
}

- (NSArray *)menuDataSource {
    
    if(!_menuDataSource) {
        
        _menuDataSource =  @[@"Dash Board",@"Leader Board"] ;
    }
    
    return _menuDataSource;
}


#pragma mark - PageHeaderViewDelegate

- (void)clickedMenuButton:(id)sender  {
    
    [self.customSlideMenu show];
    
}
- (void)clickedNotificationButton:(id)sender{
    
}


#pragma mark - CustomSlideMenuDataSource

-(NSInteger)numberOfSectionsInSideMenu:(CustomSlideMenu *)sideMenu
{
    return 1;
}

-(NSInteger)sideMenu:(CustomSlideMenu *)sideMenu numberOfRowsInSection:(NSInteger)section
{
    
    return self.menuDataSource.count;
}

-(CustomSlideMenuItem *)sideMenu:(CustomSlideMenu *)sideMenu itemForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomSlideMenuItem *item = [CustomSlideMenuItem new];
    
    if (sideMenu == self.customSlideMenu)
    {
        
        item.title = [self.menuDataSource objectAtIndex:indexPath.row];
        
    }
    
    return item;
}

#pragma mark - CustomSlideMenuDelegate

-(void)sideMenu:(CustomSlideMenu *)sideMenu didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [NSObject performInMainThreadAfterDelay:0.3 completion:^{
        
        [self moveToPageWithIndex:indexPath.row];
        [self.headerView setPageTitle:self.menuDataSource[indexPath.row]];
        
    }];
    
}


#pragma mark - Sales Force

- (void)initialishedSalesForce {
    
    [SFLogger setLogLevel:SFLogLevelDebug];
    
    // Need to use SalesforceSDKManagerWithSmartStore when using smartstore
    [SalesforceSDKManager setInstanceClass:[SalesforceSDKManagerWithSmartStore class]];
    
    [SalesforceSDKManager sharedManager].connectedAppId = RemoteAccessConsumerKey;
    [SalesforceSDKManager sharedManager].connectedAppCallbackUri = OAuthRedirectURI;
    [SalesforceSDKManager sharedManager].authScopes = @[ @"web", @"api" ];
    
    __weak typeof(self) weakSelf = self;
    
    [SalesforceSDKManager sharedManager].postLaunchAction = ^(SFSDKLaunchAction launchActionList) {
        
        //
        // If you wish to register for push notifications, uncomment the line below.  Note that,
        // if you want to receive push notifications from Salesforce, you will also need to
        // implement the application:didRegisterForRemoteNotificationsWithDeviceToken: method (below).
        //
        // [[SFPushNotificationManager sharedInstance] registerForRemoteNotifications];
        //
        
        [weakSelf log:SFLogLevelInfo format:@"Post-launch: launch actions taken: %@", [SalesforceSDKManager launchActionsStringRepresentation:launchActionList]];
        
        [weakSelf setupRootViewController];
        
        
        weakSelf.menuDataSource = nil;
        weakSelf.isLogedIn = YES;
        [weakSelf.customSlideMenu.tableView reloadData];
        
        
    };
    
    
    [SalesforceSDKManager sharedManager].launchErrorAction = ^(NSError *error, SFSDKLaunchAction launchActionList) {
        
        
        [weakSelf log:SFLogLevelError format:@"Error during SDK launch: %@", [error localizedDescription]];
        [weakSelf initializeAppViewState];
        [[SalesforceSDKManager sharedManager] launch];
        
    };
    
    [SalesforceSDKManager sharedManager].postLogoutAction = ^{
        
        [weakSelf handleSdkManagerLogout];
        
    };
    
    [SalesforceSDKManager sharedManager].switchUserAction = ^(SFUserAccount *fromUser, SFUserAccount *toUser) {
        [weakSelf handleUserSwitch:fromUser toUser:toUser];
    };
}

#pragma mark - Private methods

- (void)initializeAppViewState
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initializeAppViewState];
        });
        return;
    }
    
    //    self.window.rootViewController = [[InitialViewController alloc] initWithNibName:nil bundle:nil];
    //    [self.window makeKeyAndVisible];
}

- (void)setupRootViewController
{
    //    RootViewController *rootVC = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    //    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    //    self.window.rootViewController = navVC;
    
    [self moveToPageWithIndex:kPageDashBoard];
    
}

- (void)resetViewState:(void (^)(void))postResetBlock
{
    if ([[AppDelegate appdelegateShareInstance].window.rootViewController presentedViewController]) {
        [[AppDelegate appdelegateShareInstance].window.rootViewController dismissViewControllerAnimated:NO completion:^{
            postResetBlock();
        }];
    } else {
        postResetBlock();
    }
}

- (void)handleSdkManagerLogout
{
    [self log:SFLogLevelDebug msg:@"SFAuthenticationManager logged out.  Resetting app."];
    [self resetViewState:^{
        //[self initializeAppViewState];
        
        // Multi-user pattern:
        // - If there are two or more existing accounts after logout, let the user choose the account
        //   to switch to.
        // - If there is one existing account, automatically switch to that account.
        // - If there are no further authenticated accounts, present the login screen.
        //
        // Alternatively, you could just go straight to re-initializing your app state, if you know
        // your app does not support multiple accounts.  The logic below will work either way.
        
        
        NSArray *allAccounts = [SFUserAccountManager sharedInstance].allUserAccounts;
        
        if ([allAccounts count] > 1) {
            
            SFDefaultUserManagementViewController *userSwitchVc = [[SFDefaultUserManagementViewController alloc] initWithCompletionBlock:^(SFUserManagementAction action) {
                
                [[AppDelegate appdelegateShareInstance].window.rootViewController dismissViewControllerAnimated:YES completion:NULL];
                
            }];
            
            [[AppDelegate appdelegateShareInstance].window.rootViewController presentViewController:userSwitchVc animated:YES completion:NULL];
            
        } else {
            
            if ([allAccounts count] == 1) {
                
                [SFUserAccountManager sharedInstance].currentUser = ([SFUserAccountManager sharedInstance].allUserAccounts)[0];
            }
            
            [[SalesforceSDKManager sharedManager] launch];
        }
    }];
}

- (void)handleUserSwitch:(SFUserAccount *)fromUser
                  toUser:(SFUserAccount *)toUser
{
    
    [self log:SFLogLevelDebug format:@"SFUserAccountManager changed from user %@ to %@.  Resetting app.",
     fromUser.userName, toUser.userName];
    
    
    [self resetViewState:^{
        [self initializeAppViewState];
        [[SalesforceSDKManager sharedManager] launch];
    }];
}




@end
