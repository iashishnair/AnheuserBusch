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

@interface ChatterViewController () <FeedListTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIButton *postCommentButton;
@property (weak, nonatomic) IBOutlet UITextField *postCommentTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic, strong) id <ChatterViewControllerProtocol> presenter;

@end
@implementation ChatterViewController

	//http://stackoverflow.com/questions/8134102/self-login-in-salesforce-api-in-iphone

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
	//
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
	
	tableView.sectionHeaderHeight = 80.0f;
	tableView.sectionFooterHeight = 10.0f;

	return self.dataSource.count;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	
	UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10.0f)];
	view.backgroundColor = [UIColor colorWithWhite:.5 alpha:.5];
	return view;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
	if(section == 1) {
		
		NSLog(@"w");
		
	}
	
	FeedListTableViewCell *header = nil;
	
	if(self.dataSource && self.dataSource.count > section) {
		
		FeedDataModel *feedDataModel = [self.dataSource objectAtIndex:section];
		
	 header =  [[FeedListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"d"];
		
		[header setFeedDataModel:feedDataModel];
		
		header.delegate = self;
		header.backgroundColor =[UIColor clearColor];
	}
	
	
	return header;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSInteger comments  = 1;
	
	
	if(1) {
		FeedDataModel *feedDataModel = [self.dataSource objectAtIndex:section];
		
		comments = [[[feedDataModel commentModel] feedCommentItems] count];
		
	}
	
	return comments;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	return indexPath.row == 0? 40.0f : 40.0f;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	NSString *cellIdentifire = [NSString stringWithFormat:@"%ld- %ld",(long)indexPath.section,(long)indexPath.row];
	
	FeedListTableViewCell *cell = (FeedListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
	
	if(!cell) {
		
		cell = [[FeedListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifire];
		cell.delegate = self;
		
	}
	
	if(indexPath.section < self.dataSource.count) {
		
		FeedDataModel *feedDataModel = [self.dataSource objectAtIndex:indexPath.section];
		
			//        if(indexPath.row == 0 && feedDataModel) {
			//
			//            [cell setFeedDataModel:feedDataModel];
			//
			//
			//        } else
		
		{
		
		CommentItemModel *commentItemModel = [[feedDataModel commentModel] feedCommentItems][indexPath.row];
		
		
		if(commentItemModel) {
			[cell setCommentItemModel:commentItemModel];
			
		} else {
			
			cell.textLabel.text = @"No comments";
		}
		
		
		}
		
		
	}
	return cell;
	
}

#pragma mark - FeedListTableViewCellDelegate

- (void)clickedLikeButton:(nonnull UIButton *)sender feedDataModel:(nonnull FeedDataModel *)feedDataModel {
	
	[self.presenter likeAFeed:feedDataModel.feedID completion:^(NSError *error, SOQLStatus status) {
		
		
	}];
	
}


- (void)clickedCommentButton:(nonnull UIButton *)sender feedDataModel:(nonnull FeedDataModel *)feedDataModel {
	
	NSString *date = [[NSDate date] description];
	date = [NSString stringWithFormat:@"New comment at: %@",date];
	
	[self.presenter postCommentOnAfeed:feedDataModel.feedID messageText:date completion:^(NSError *error, SOQLStatus status) {
		
	}];
}


#pragma mark - IBAction

- (IBAction)ClickedPostCommentButton:(UIButton *)sender {
	
	
	if( ![NSString isNULLString:self.postCommentTextField.text]) {
		
		
		if(self.dataSource) {
			
			FeedDataModel *feedDataModel = [self.dataSource objectAtIndex:0];
			if(feedDataModel) {
				
				NSString *actorID = feedDataModel.actorDataModel.actorID;
				sender.enabled = NO;
				
				if(actorID.length) {
					[self.presenter postAFeed:actorID messageText:self.postCommentTextField.text completion:^(NSError *error, SOQLStatus status) {
						
						sender.enabled = YES;
						
						_postCommentTextField.text = nil;
						
					}];
				}
			}
		}
		
		
	}
}

#pragma mark - Private Method

-(id <ChatterViewControllerProtocol>)presenter {
	
	if (!_presenter) {
		
		_presenter = [ChatterViewControllerPresenter new];
		
	}
	return _presenter;
}


@end
