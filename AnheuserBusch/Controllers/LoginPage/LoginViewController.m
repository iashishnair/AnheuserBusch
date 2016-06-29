//
//  LoginViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "LoginViewController.h"
#import <SalesforceSDKCore/SFPushNotificationManager.h>
#import <SalesforceSDKCore/SFDefaultUserManagementViewController.h>
#import <SalesforceSDKCore/SalesforceSDKManager.h>
#import <SalesforceSDKCore/SFUserAccountManager.h>
#import <SalesforceSDKCore/SFLogger.h>
#import <SmartStore/SalesforceSDKManagerWithSmartStore.h>
#import "SalesForceSOQL.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "MenuListViewController.h"
#import "CustomSideMenuOptions.h"
#import "CustomSideMenuController.h"
#import "ProfileViewController.h"
#import "OnBoardingViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"

@implementation LoginViewController

#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
	
    self.navigationController.navigationBarHidden = YES;

    
//    // Open It for Sales force Login
//    if(![SFUserAccountManager sharedInstance].isCurrentUserAnonymous || ![SFUserAccountManager sharedInstance].currentUser.credentials.accessToken ) {
//        
//        
//        [self initialishedSalesForce];
//    }
//    else {
//        
//        // [[SalesforceSDKManager sharedManager] launch];
//    }
}


- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	[self initialishedSalesForce];
	[[SalesforceSDKManager sharedManager] launch];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
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
        
        
        //        weakSelf.menuDataSource = nil;
        //        weakSelf.isLogedIn = YES;
        //        [weakSelf.customSlideMenu.tableView reloadData];
        
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
    
    [[AppDelegate appdelegateShareInstance]setupSlideMenuViewController];
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
