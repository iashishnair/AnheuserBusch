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

@interface ProfileViewController ()

@property (strong, nonatomic) NSMutableArray *incentiveDetailsDataSource;
@property (strong, nonatomic) id <ProfileViewProtocol> presenter;

@end

@implementation ProfileViewController

-(void)viewDidLoad {
    
    [super  viewDidLoad];
    self.incentiveDetailsDataSource = [self.presenter incentiveDataSourcePopulate];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (id <ProfileViewProtocol>)presenter {
    
    if(!_presenter) {
        
        _presenter = [ProfileViewPresenter new];
    }
    
    return _presenter;
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
//    
//    cell.IncentiveName.text = @"Summer Incentive";
//    cell.RankLabel.text = @"Rank";
//    cell.statusTitleLabel.text = @"Way To Go!!!!";
//    cell.statusDescriptionLabel.text = @"Out of 15 KPI's you have achieved 12 KPI's";
    
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


@end
