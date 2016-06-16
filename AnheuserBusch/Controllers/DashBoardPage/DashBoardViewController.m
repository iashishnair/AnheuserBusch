//
//  DashBoardViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 14/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "DashBoardViewController.h"
#import "DashboardCustomCell.h"
#import "DashBoardDataModel.h"
#import "DashBoardViewControllerPresenter.h"
#import "Constants.h"

@interface DashBoardViewController ()

@property (weak, nonatomic) IBOutlet UIView *topChartView;
@property (weak, nonatomic) IBOutlet UILabel *midLabel;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UILabel *achievmentsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;


@property (strong, nonatomic) NSMutableArray *dashBoardDetailsDataSource;
@property (strong, nonatomic) id <DashBoardViewControllerProtocol> presenter;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dashBoardDetailsDataSource = [self.presenter getDashBoardDataSource];
    [self configureUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

- (void)configureUI {
    
    self.midLabel.text = taskTableHeading;
    self.achievmentsLabel.text = achievmentsLabelText;
}

- (id <DashBoardViewControllerProtocol>)presenter {
    
    if(!_presenter) {
        
        _presenter = [DashBoardViewControllerPresenter new];
    }
    
    return _presenter;
}


#pragma -mark table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dashBoardDetailsDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    
    DashboardCustomCell *cell = (DashboardCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[DashboardCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(self.dashBoardDetailsDataSource.count > indexPath.row)
        
    {
        DashBoardDataModel *dashBoardDataModel = [self.dashBoardDetailsDataSource objectAtIndex:indexPath.row];
        
        if(dashBoardDataModel) {
            
            [cell updateCell:dashBoardDataModel];

        }
        
    }
    
    return cell;
}


@end
