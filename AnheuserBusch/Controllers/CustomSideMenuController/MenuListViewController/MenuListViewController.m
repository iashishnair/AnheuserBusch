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

@interface MenuListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *menuItems;

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
     
	self.menuItems = @[@"Profile", @"Overall Ranking", @"Chatter", @"Help and Support", @"Logout"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 60.0f;
}
#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    switch (indexPath.row) {
        case 0:
        {
            ProfileViewController *contentVC;
            
            UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            contentVC = [mystoryboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
            [self loadController:contentVC];
      }
            break;
            
        case 4:
        {
            [[AppDelegate appdelegateShareInstance] handleSdkManagerLogout];
        }
            break;
 
        default:
            break;
    }
	
}



-(void)loadController:(UIViewController *)controller {
//    CustomContentViewController *contentVC = [[CustomContentViewController alloc] initWithNibName:@"MVYContentViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [[self sideMenuController] changeContentViewController:navigationController closeMenu:YES];
}



@end
