//
//  MVYContentViewController.h
//  MVYSideMenuExample
//
//  Created by Álvaro Murillo del Puerto on 10/07/13.
//  Copyright (c) 2013 Mobivery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContentViewController : UIViewController

- (IBAction)openMenu:(id)sender;

@end


/*
 
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
 self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 // Override point for customization after application launch.
	
	MenuListViewController *menuListViewController = [[MenuListViewController alloc] initWithNibName:@"MenuListViewController" bundle:nil];
	CustomContentViewController *contentVC = [[CustomContentViewController alloc] initWithNibName:@"CustomContentViewController" bundle:nil];
	UINavigationController *contentNavigationController = [[UINavigationController alloc] initWithRootViewController:contentVC];
	
 CustomSideMenuOptions *options = [[CustomSideMenuOptions alloc] init];
	options.contentViewScale = 1.0;
	options.contentViewOpacity = 0.05;
	options.shadowOpacity = 0.0;
 
	CustomSideMenuController *sideMenuController = [[CustomSideMenuController alloc] initWithMenuViewController:menuListViewController contentViewController:contentNavigationController options:options];
	sideMenuController.menuFrame = CGRectMake(0, 20.0, 220.0, self.window.bounds.size.height - 20.0);
	
	self.window.rootViewController = sideMenuController;
 [self.window makeKeyAndVisible];
 return YES;
 }

 */