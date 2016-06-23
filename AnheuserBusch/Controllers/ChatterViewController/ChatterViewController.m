	//
	//  SOQLTester.m
	//  AnheuserBusch
	//
	//  Created by Prsenjit Goswami on 22/06/16.
	//  Copyright © 2016 Cognizant. All rights reserved.
	//

#import "ChatterViewController.h"
#import "Constants.h"
#import <SalesforceSDKCore/SFPushNotificationManager.h>
#import <SalesforceSDKCore/SFDefaultUserManagementViewController.h>
#import <SalesforceSDKCore/SalesforceSDKManager.h>
#import <SalesforceSDKCore/SFUserAccountManager.h>
#import <SalesforceSDKCore/SFLogger.h>
#import <SmartStore/SalesforceSDKManagerWithSmartStore.h>
#import "SalesForceSOQL.h"
#import "AppDelegate.h"

#import "FeedListTableViewCell.h"
#import "ChatterViewControllerPresenter.h"

@interface ChatterViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic, strong) id <ChatterViewControllerProtocol> presenter;

@end
@implementation ChatterViewController

-(void)login {
	
	[[SFAuthenticationManager sharedManager] loginWithCompletion:nil failure:nil];
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
		// Open It for Sales force Login
	if(![SFUserAccountManager sharedInstance].isCurrentUserAnonymous && ![SFUserAccountManager sharedInstance].currentUser.credentials.accessToken ) {
		
		
		[self initialishedSalesForce];
	}
	else {
		
		
		
			// [[SalesforceSDKManager sharedManager] launch];
		
	}
}
- (IBAction)clickedSalesForce:(id)sender {
	
		// [self initialishedSalesForce];
		// [[SalesforceSDKManager sharedManager] launch];
	[self.presenter fetchChatterkFeedBack:^(NSArray *results) {
		
		self.dataSource = results;
		[self.tableView reloadData];
		
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
		//    RootViewController *rootVC = [[RootViewController alloc] initWithNibName:nil bundle:nil];
		//    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
		//    self.window.rootViewController = navVC;
	
  //  [self moveToPageWithIndex:kPageDashBoard];
	
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


#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.dataSource.count;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	return 80.0f;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	static NSString *cellIdentifire = @"FeedListTableViewCell";
	
	FeedListTableViewCell *cell = (FeedListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
	
	if(!cell) {
		
		cell = [[FeedListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifire];
		
	}
	
	if(indexPath.row < self.dataSource.count) {
		FeedDataModel *feedDataModel = [self.dataSource objectAtIndex:indexPath.row];
		cell.feedDataModel = feedDataModel;
	}
	return cell;
	
}

#pragma mark - Private Method

-(id <ChatterViewControllerProtocol>)presenter {
	
	if (!_presenter) {
		
		_presenter = [ChatterViewControllerPresenter new];
		
	}
	return _presenter;
}
@end
