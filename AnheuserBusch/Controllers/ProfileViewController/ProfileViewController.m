//
//  ProfileViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfilePageCustomCell.h"
#import "IncentiveDataModel.h"
#import "ProfileViewPresenter.h"
#import "PeerRankingDetailViewController.h"
#import "KPIRankingViewController.h"
#import "ProfilePageDataModel.h"
#import "Constants.h"
#import "UIView+Common.h"

@interface ProfileViewController () <ProfilePageCustomCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (strong, nonatomic) NSArray *incentiveDetailsDataSource;
@property (strong, nonatomic) id <ProfileViewProtocol> presenter;
@property (strong, nonatomic) ProfilePageDataModel *profileDataModel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIView *profileDetailsView;

@end

@implementation ProfileViewController


#pragma mark - View Controller Life Cycle

-(void)viewDidLoad {
    
    [super  viewDidLoad];
    
    self.incentiveDetailsDataSource = [self.presenter incentiveDataSourcePopulate];
    self.profileDataModel = [self.presenter profileInfoPopulate];
    self.title = MenuItems[0];
    [self configureUI];
    
}

#pragma mark- private methods

-(void)configureUI {
  
    //self.view =
    self.headingLabel.font = PROFILE_INCENTIVE_TABLE_HEADING_FONT;
    self.title = MenuItems[0];
    self.headingLabel.text = @"My Incentives";
    self.userNameLabel.text = self.profileDataModel.userName;
    
}

-(void)dealloc {
    
    _presenter = nil;
    _incentiveDetailsDataSource = nil;
    
}

#pragma mark - Private Method

- (id <ProfileViewProtocol> )presenter {
    
    if(!_presenter) {
        
        _presenter = [ProfileViewPresenter new];
    }
    
    return _presenter;
}

- (NSArray *)incentiveDetailsDataSource {
    
    if(!_incentiveDetailsDataSource) {
        
        _incentiveDetailsDataSource = [self.presenter incentiveDataSourcePopulate];
    }
    
    return _incentiveDetailsDataSource;
}

#pragma mark - table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  self.incentiveDetailsDataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10.0f;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10.0)];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"myCell";
    
    ProfilePageCustomCell *cell = (ProfilePageCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
    if (cell == nil) {
        
        cell = [[ProfilePageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.delegate = self;
    
        IncentiveDataModel *incentiveDataModel = (IncentiveDataModel *) [NSArray objectFromArray:self.incentiveDetailsDataSource atIndex:indexPath.section];
        
        if(incentiveDataModel) {
            
            [cell updateCell:incentiveDataModel atIndex:indexPath.section];
        }
    
    UIView *view = [[UIView alloc]initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.cornerRadius = 3.0f;
    cell.backgroundView = view;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - IBAction

#pragma mark ProfilePageCustomCellDelegate

- (void)clickedPeerRanking:(UIButton *)sender atIndex:(NSUInteger)index {
    
    
    PeerRankingDetailViewController *peerRankingDetailViewController = (PeerRankingDetailViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDPeerRankingDetailViewController];
    
    [self.navigationController pushViewController:peerRankingDetailViewController animated:YES];
    
}

- (void)clickedKPIRanking:(UIButton *)sender atIndex:(NSUInteger)index {
    
    IncentiveDataModel *incentiveDataModel = [NSArray objectFromArray:self.incentiveDetailsDataSource atIndex:index];
    
    if(incentiveDataModel) {
       
        KPIRankingViewController *kPIRankingViewController = (KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDKPIRankingViewController];
        kPIRankingViewController.incentiveDataModel = incentiveDataModel;
        
        [self.navigationController pushViewController:kPIRankingViewController animated:YES];
        
    }
}
@end
