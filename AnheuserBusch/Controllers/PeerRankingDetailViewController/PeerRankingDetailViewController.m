//
//  PeerRankingDetailView/Users/MM-IMac/Desktop/Payel/payel_work/AnheuserBusch/AnheuserBusch/CustomUIComponent/TableViewCell/PeerRankingDetailPageCell.mController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 28/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PeerRankingDetailViewController.h"
#import "PeerRankingDetailPresenter.h"
#import "PeerRankingDataModel.h"
#import "PeerRankingDetailPageCell.h"
#import "Constants.h"

@interface PeerRankingDetailViewController ()

@property (strong, nonatomic) NSMutableArray *peerRankingDetailsDataSource;
@property (strong, nonatomic) id <PeerRankingDetailProtocol> presenter;
@property (weak, nonatomic) IBOutlet UILabel *noOfDaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewHeading;

@end

@implementation PeerRankingDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.peerRankingDetailsDataSource = [self.presenter peerRankingDetailDataSourcePopulate];
    [self configureUI];
    // test code
  }



#pragma mark- private methods

-(void) configureUI {
    
    self.noOfDaysLabel.text = @"10 days to win.";
    self.viewHeading.text = viewHeading;
    
}

- (id <PeerRankingDetailProtocol>)presenter {
    
    if(!_presenter) {
        
        _presenter = [PeerRankingDetailPresenter new];
    }
    
    return _presenter;
}

#pragma mark- table view delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.peerRankingDetailsDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    
    
    PeerRankingDetailPageCell *cell = (PeerRankingDetailPageCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[PeerRankingDetailPageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (self.peerRankingDetailsDataSource.count > indexPath.row) {
        
        PeerRankingDataModel *peerRankingDataModel = [self.peerRankingDetailsDataSource objectAtIndex:indexPath.row];
        
        [cell updateCell:peerRankingDataModel];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

@end
