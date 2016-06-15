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

@interface DashBoardViewController ()

@property (strong, nonatomic) NSMutableArray *dashBoardDetailsDataSource;
@property (strong, nonatomic)NSMutableArray *descriptions;
@property (strong, nonatomic)NSMutableArray *dates;
@property (strong, nonatomic) NSMutableArray *titles;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
    self.dashBoardDetailsDataSource = [self getDashBoardDatasource];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

-(void)configureUI {
    
    self.midLabel.text = @"My Tasks For This Week";
    
    self.achievmentsLabel.text = @"  Achievments This week ?";
    
    
}

-(NSMutableArray *)getDashBoardDatasource {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    
    self.titles = [[NSMutableArray alloc]initWithObjects:@"Title1",@"Title2",@"Title3",nil];
    
    
    self.descriptions = [[NSMutableArray alloc]initWithObjects:@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",nil];
    
    self.dates = [[NSMutableArray alloc]initWithObjects:@"8 JUN",@"10 JUN",@"11 JUN", nil];
    
    
    for(int i = 0;i < 3 ;i++)
    {
        DashBoardDataModel *dashBoardDataModel = [[DashBoardDataModel alloc]init];
        dashBoardDataModel.taskTitle = [self.titles objectAtIndex:i];
        dashBoardDataModel.taskDescription = [self.descriptions objectAtIndex:i];
        dashBoardDataModel.taskDate = [self.dates objectAtIndex:i];
        [resultsArray addObject:dashBoardDataModel];
        
    }
    
    return resultsArray;
    
    
    
    
    
}

#pragma -mark table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dashBoardDetailsDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    DashboardCustomCell *cell = (DashboardCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[DashboardCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(self.dashBoardDetailsDataSource.count > indexPath.row)
        
    {
        DashBoardDataModel *dashBoardDataModel = [[DashBoardDataModel alloc]init];
        
        dashBoardDataModel = [self.dashBoardDetailsDataSource objectAtIndex:indexPath.row];
        
        if(dashBoardDataModel.taskTitle) {
            
            NSString *titleText = dashBoardDataModel.taskTitle;
            
            cell.titleLabel.text = titleText;
            
        }
        
        cell.circleImage.image = [UIImage imageNamed:@"taskCircle"];
        
        if(dashBoardDataModel.taskDescription) {
            
            NSString *descriptionText = dashBoardDataModel.taskDescription;
            
            cell.descriptionLabel.text = descriptionText;
        }
        
        if(dashBoardDataModel.taskDate) {
            
            NSString *dateText = dashBoardDataModel.taskDate;
            
            cell.dateLabel.text = dateText;
            
        }
        
    }
    
    return cell;
}


@end
