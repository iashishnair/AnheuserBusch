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

@property (strong, nonatomic) NSMutableArray *incentiveDetailsDataSource;
@property (strong, nonatomic) id <ProfileViewProtocol> presenter;


@end

@implementation ProfileViewController

-(void)viewDidLoad {
    
    [super  viewDidLoad];
	self.incentiveDetailsDataSource = [self.presenter incentiveDataSourcePopulate];
	self.title = MenuItems[0];
	
    self.headingLabel.text = @"My Incentives";
}


- (id <ProfileViewProtocol> )presenter {
    
    if(!_presenter) {
        
        _presenter = [ProfileViewPresenter new];
    }
    
    return _presenter;
}

-(void)dealloc {
	
	
}

#pragma mark - table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     static NSString *cellIdentifier = @"myCell";
    ProfilePageCustomCell *cell = (ProfilePageCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ProfilePageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(_incentiveDetailsDataSource.count > indexPath.row)
    {
        IncentiveDataModel *incentiveDataModel = [self.incentiveDetailsDataSource objectAtIndex:indexPath.row];
        
        if(incentiveDataModel) {
            [cell updateCell:incentiveDataModel];
        }
    }
    
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
