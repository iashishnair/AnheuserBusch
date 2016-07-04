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

@interface ProfileViewController () <ProfilePageCustomCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (strong, nonatomic) NSArray *incentiveDetailsDataSource;
@property (strong, nonatomic) id <ProfileViewProtocol> presenter;


@end

@implementation ProfileViewController


#pragma mark - View Controller Life Cycle

-(void)viewDidLoad {
    
    [super  viewDidLoad];
  
    self.title = MenuItems[0];
    self.headingLabel.text = @"My Incentives";
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
    
    return self.incentiveDetailsDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"myCell";
    
    ProfilePageCustomCell *cell = (ProfilePageCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
    if (cell == nil) {
        
        cell = [[ProfilePageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.delegate = self;
    
    if(self.incentiveDetailsDataSource.count > indexPath.row)
    {
        IncentiveDataModel *incentiveDataModel = [self.incentiveDetailsDataSource objectAtIndex:indexPath.row];
        
        if(incentiveDataModel) {
            [cell updateCell:incentiveDataModel];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - IBAction


- (void)clickedRightMenuButton {
    
}

#pragma mark ProfilePageCustomCellDelegate

- (void)clickedPeerRanking:(UIButton *)sender {
    
    
    PeerRankingDetailViewController *peerRankingDetailViewController = (PeerRankingDetailViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDPeerRankingDetailViewController];
    
    [self.navigationController pushViewController:peerRankingDetailViewController animated:YES];
    
}

- (void)clickedKPIRanking:(UIButton *)sender {
    
    KPIRankingViewController *kPIRankingViewController = (KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDKPIRankingViewController];
    
    [self.navigationController pushViewController:kPIRankingViewController animated:YES];
    
}
@end
