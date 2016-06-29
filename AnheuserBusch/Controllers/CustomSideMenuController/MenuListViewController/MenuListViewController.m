	//
	//  MVYMenuViewController.m
	//  AnheuserBusch
	//
	//  Created by Prsenjit Goswami on 10/06/16.
	//  Copyright © 2016 Cognizant. All rights reserved.
	//

#import "MenuListViewController.h"
#import "CustomSideMenuController.h"
#import "ProfileViewcontroller.h"
#import "MenuListTableViewListCell.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "SalesForceChatterHelper.h"
#import "FeedDataModel.h"
#import "UIResponder+UIComponentUtility.h"

@interface MenuListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *menuItems;
@property (weak, nonatomic) IBOutlet UIView *roundConerView;

@end

@implementation MenuListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
			// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
		// Do any additional setup after loading the view from its nib.
	[self.tableView registerNib:[UINib nibWithNibName:@"MenuListTableViewListCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
	
	self.userImageView.layer.cornerRadius = 50.0f;
	self.userImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
	self.userImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
	self.userImageView.clipsToBounds = YES;
	self.userImageView.layer.borderWidth = 3.0f;
	
	id username = [NSUserDefaults readUserDefault:@"username"];
	
	
	if(![NSString isNULLString:username]) {
		
		_userNameLabel.text = username;
		
	}
	__weak typeof(self) weakself = self;
	
	[[SalesForceChatterHelper shareInstance]fetchUserAllDetails:^(NSArray *results) {
		
		if(results && results.count) {
			
			FeedDataModel *feedDataModel = results[0];
			
			if(feedDataModel) {
				
				ActorDataModel *actorDataModel = feedDataModel.actorDataModel;
				
				
				if(![NSString isNULLString:actorDataModel.fullName])
					{
					NSString *username = actorDataModel.fullName;
					weakself.userNameLabel.text = username;
					[NSUserDefaults saveObject:username forKey:@"username"];
					}
				
				if(actorDataModel) {
					
					ActorPhotoDataModel *actorPhotoDataModel = actorDataModel.actorPhotoDataModel;
					
					if(![NSString isNULLString:actorPhotoDataModel.standardEmailPhotoUrl])
						{
						NSString *standardEmailPhotoUrl = actorPhotoDataModel.standardEmailPhotoUrl;
						
						[_userImageView imageWithURLString:standardEmailPhotoUrl];
						
						[NSUserDefaults saveObject:standardEmailPhotoUrl forKey:@"standardEmailPhotoUrl"];
						}
					
				}
			}
			
		}
		
	}];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
}

#pragma mark - Private Method

- (NSArray *)menuItems {
	
	if(!_menuItems) {
		
		_menuItems = MenuItems;
	}
	
	return _menuItems;
}

#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"MenuCell";
	
	MenuListTableViewListCell *cell = (MenuListTableViewListCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	NSString *item = [self.menuItems objectAtIndex:indexPath.row];
	cell.menuTitleLabel.text = item;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.backgroundColor = [UIColor clearColor];
	return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 44.0f;
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	if(self.delegate && [self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:)]) {
		
		[self.delegate didSelectRowAtIndexPath:indexPath];
		
	}
}

@end
