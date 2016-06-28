//
//  AppDelegate.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "MenuListViewController.h"
#import "CustomSideMenuOptions.h"
#import "CustomSideMenuController.h"
#import "ProfileViewController.h"
#import "OnBoardingViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//- (BOOL)application:(UIApplication *)application _didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    
//    
//    // Override point for customization after application launch.
//    //    [self initializeAppViewState];
//    
//    //If you wish to customize the color, textcolor, font and fontsize of the navigation bar uncomment the
//    //code below.
//    //
//    //SFLoginViewController *loginViewController = [SFLoginViewController sharedInstance];
//    // Set primary color to different color to style the navigation header
//    //loginViewController.navBarColor = [UIColor colorWithRed:0.051 green:0.765 blue:0.733 alpha:1.0];
//    //loginViewController.navBarFont = [UIFont fontWithName:@"Helvetica" size:16.0];
//    //loginViewController.navBarTextColor = [UIColor blackColor];
//    //
//    //    [[SalesforceSDKManager sharedManager] launch];
//    return YES;
//}
//



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BOOL isLogedIn = [SFUserAccountManager sharedInstance].isCurrentUserAnonymous && [SFUserAccountManager sharedInstance].currentUser.credentials.accessToken ;
    
    id OnboardingIsShown  = [NSUserDefaults readUserDefault:kOnboardingIsShown];
    
    if(![OnboardingIsShown boolValue]) {
    
        [self setOnBoardingViewControllerAsRootViewController];
        
    } else if(!isLogedIn) {
        
        [self setLoginViewControllerAsRootViewController];
        
    } else {
        
        [self setupSlideMenuViewController];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.cognizantenterprisemobility.AnheuserBusch" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AnheuserBusch" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AnheuserBusch.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark - Private method 

- (void)setOnBoardingViewControllerAsRootViewController {
    
    
    OnBoardingViewController * onBoardingViewController = (OnBoardingViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"OnBoardingViewController"];
    
    UINavigationController *rootViewController = [[UINavigationController alloc] initWithRootViewController:onBoardingViewController];
    
    self.window.rootViewController = rootViewController;
}
- (void)setLoginViewControllerAsRootViewController {
    
    LoginViewController * loginViewController = (LoginViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    UINavigationController *rootViewController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    self.window.rootViewController = rootViewController;
}

#pragma mark - Public Method

+ (AppDelegate *)appdelegateShareInstance {
    
    return [UIApplication sharedApplication].delegate;
    
}

- (void)setupSlideMenuViewController
{
    
    MenuListViewController *menuListViewController = [[MenuListViewController alloc] initWithNibName:@"MenuListViewController" bundle:nil];
    
    ProfileViewController * profileViewController = (ProfileViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    
    UINavigationController *contentNavigationController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    CustomSideMenuOptions *options = [[CustomSideMenuOptions alloc] init];
    options.contentViewScale = 1.0;
    options.contentViewOpacity = 0.05;
    options.shadowOpacity = 0.0;
    
    CustomSideMenuController *customSideMenuController = [[CustomSideMenuController alloc] initWithMenuViewController:menuListViewController contentViewController:contentNavigationController options:options];
    customSideMenuController.menuFrame = CGRectMake(0, 20.0, [AppDelegate appdelegateShareInstance].window.bounds.size.width - 50.0f, [AppDelegate appdelegateShareInstance].window.bounds.size.height - 20.0);
    [AppDelegate appdelegateShareInstance].window.rootViewController = customSideMenuController;
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
