//
//  DashBoardViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 14/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "DashBoardViewController.h"
#import "DashboardCustomCell.h"

@interface DashBoardViewController ()

@property (strong,nonatomic) NSMutableArray *titlesArray;

@property (strong, nonatomic)NSMutableArray *descriptionArray;

@property (strong, nonatomic)NSMutableArray *dateArray;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
    [self createDatasource];
    
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

-(void)createDatasource {
    
    self.titlesArray = [[NSMutableArray alloc]initWithObjects:@"Title1",@"Title2",@"Title3",nil];
    
    
    self.descriptionArray = [[NSMutableArray alloc]initWithObjects:@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",@"Apple's sweeping new artificial intelligence play takes a page from features introduced by rival tech companies in recent years",nil];
    
    self.dateArray = [[NSMutableArray alloc]initWithObjects:@"8 JUN",@"10 JUN",@"11 JUN", nil];
    

}

#pragma -mark table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titlesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    DashboardCustomCell *cell = (DashboardCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[DashboardCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(self.titlesArray.count > indexPath.row)
        
    {
        if(self.titlesArray) {
    
    cell.titleLabel.text = [self.titlesArray objectAtIndex:indexPath.row];
            
        }

    cell.circleImage.image = [UIImage imageNamed:@"yellowCircle.png"];
        
        if(self.descriptionArray) {
    
    cell.descriptionLabel.text = [self.descriptionArray objectAtIndex:indexPath.row];
            
        }
        
        if(self.dateArray) {
    
    cell.dateLabel.text = [self.dateArray objectAtIndex:indexPath.row];
            
        }
        
    }
    
    return cell;
}


@end
