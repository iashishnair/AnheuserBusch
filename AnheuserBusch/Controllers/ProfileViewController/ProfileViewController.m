//
//  ProfileViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfilePageCustomCell.h"

@implementation ProfileViewController

-(void)viewDidLoad {
    
}

#pragma mark - table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     static NSString *cellIdentifier = @"myCell";
    ProfilePageCustomCell *cell = (ProfilePageCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ProfilePageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.IncentiveName.text = @"Summer Incentive";
    cell.RankLabel.text = @"Rank";
    cell.statusTitleLabel.text = @"Way To Go!!!!";
    cell.statusDescriptionLabel.text = @"Out of 15 KPI's you have achieved 12 KPI's";
    
    return cell;
    
}

@end
