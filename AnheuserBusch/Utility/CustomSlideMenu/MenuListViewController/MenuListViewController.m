//
//  MVYMenuViewController.m
//  MVYSideMenuExample
//
//  Created by Álvaro Murillo del Puerto on 10/07/13.
//  Copyright (c) 2013 Mobivery. All rights reserved.
//

#import "MenuListViewController.h"
#import "CustomSideMenuController.h"
#import "CustomContentViewController.h"
#import "ProfileViewcontroller.h"
#import "MenuListTableViewListCell.h"

#import "ProfileViewController.h"

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
     
	self.menuItems = @[@"ProfileViewcontroller", @"Announcement", @"Message", @"Logout"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
//    if(!cell) {
//        
//        cell = ;
//    }
	
	
	return cell;
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    switch (indexPath.row) {
        case 0:
        {
//            ProfileViewController *contentVC = [[ProfileViewcontroller alloc] initWithNibName:@"ProfileViewcontroller" bundle:nil];
            
//           ProfileViewController *contentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
            
            ProfileViewController *contentVC;
            
            UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            contentVC = [mystoryboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
            [self loadController:contentVC];
      }
//            
            break;
//            
//        case 1:
//        {
//            AnnouncementViewController *contentVC = [[AnnouncementViewController alloc] initWithNibName:@"ProfileViewcontroller" bundle:nil];
//            [self loadController:contentVC];
//        }
//            
//            break;
//            
//        case 2:
//        {
//            MessageViewController *contentVC = [[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil];
//            [self loadController:contentVC];
//        }
//            
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
