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
#import "Constants.h"

@interface MenuListViewController ()

@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIImageView *userImageView;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) NSArray *menuItems;

@end

@implementation MenuListViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];

	[self configureUI];
	
	
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

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
    
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
}


#pragma mark - Private Method

-(void)configureUI {
	_userImageView = nil;
	
	_userNameLabel = nil;
    _tableView = nil;
    
	[self.view addSubview:self.bgImageView];
	[self.view addSubview:self.userImageView];
	[self.view addSubview:self.userNameLabel];
	[self.view addSubview:self.tableView];

	[self addConstraint];
}


-(void)addConstraint {
	
	
	NSDictionary *views = @{@"bgImageView": self.bgImageView,
							@"userImageView": self.userImageView,
							@"userNameLabel": self.userNameLabel,
							@"tableView": self.tableView};
	
	[self.view addConstraintsWithVisualFormat:@"H:|[bgImageView]|" options:0 metrics:nil views:views];
	[self.view addConstraintsWithVisualFormat:@"V:|[bgImageView]|" options:0 metrics:nil views:views];
	[self.view addConstraintsWithVisualFormat:@"H:[userImageView(100)]" options:0 metrics:nil views:views];
	[self.view addConstraintsWithVisualFormat:@"H:[userNameLabel]" options:0 metrics:nil views:views];
	[self.view addConstraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];


	[self.view addConstraintsWithVisualFormat:@"V:|-20-[userImageView(100)]-10-[userNameLabel(30)]-20-[tableView]|" options:0 metrics:nil views:views];
	
	[self.userImageView centerXToParent:self.view];
	[self.userNameLabel centerXToParent:self.view];


}
- (UIImageView *)bgImageView {
	
	if(!_bgImageView) {
		
		_bgImageView = [UIImageView initWithImage:nil];
		_bgImageView.backgroundColor = [UIColor whiteColorABI];
	}
	
	return _bgImageView;
}

- (UIImageView *)userImageView {
	
	
	if(!_userImageView) {
		
		_userImageView = [UIImageView initWithImage:nil];
		_userImageView.layer.cornerRadius = 50.0f;
		_userImageView.layer.borderColor = [UIColor blueColorABI].CGColor;
		_userImageView.clipsToBounds = YES;
		_userImageView.layer.borderWidth = 5.0f;

	}
	
	return _userImageView;
}

- (UILabel *)userNameLabel {
	
	if(!_userNameLabel) {
		
		_userNameLabel = [UILabel labelWithText:@"" textColor:SLIDE_MENU_USER_NAME_TEXT_COLOR textFont:SLIDE_MENU_USER_NAME_TEXT_FONT textAlignment:NSTextAlignmentCenter numberOfLines:1 backgroundColor:nil];
		
		_userNameLabel.text = @"eee";

	}
	
	return _userNameLabel;
}

-(UITableView *)tableView {
	
	if(!_tableView) {
		
		_tableView = [UITableView plainTableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;

		_tableView.backgroundColor = [UIColor whiteColor];
		_tableView.separatorColor = [UIColor clearColor];
	}
	
	return _tableView;
}


- (NSArray *)menuItems {
	
	if(!_menuItems) {
		
		_menuItems = MenuItems;
	}
	
	return _menuItems;
}

-(void)reloadMenuList {
    
    if(_tableView) {
        [_tableView reloadData];
    }
}
#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"MenuCell";
	
	MenuListTableViewListCell *cell = (MenuListTableViewListCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if(!cell) {
		
		cell = [[MenuListTableViewListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
		
	}
	NSString *item = [self.menuItems objectAtIndex:indexPath.row];
	cell.menuTitleLabel.text = item;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell updateOnSelection:(self.selectedIndexPath.section == indexPath.section && self.selectedIndexPath.row ==indexPath.row)];
	cell.backgroundColor = [UIColor whiteColor];
	
	return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return 60.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
		// This will create a "invisible" footer
	return 0.01f;
}
#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    self.selectedIndexPath = indexPath;

	if(self.delegate && [self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:)]) {
		
		[self.delegate didSelectRowAtIndexPath:indexPath];
	}
    
}

@end
