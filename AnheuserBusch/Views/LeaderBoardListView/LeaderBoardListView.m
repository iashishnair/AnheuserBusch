//
//  LeaderBoardListView.m
//  LeaderBoardScreen
//
//  Created by Prsenjit Goswami on 6/13/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import "LeaderBoardListView.h"
#import "MyCustomCell.h"
#import "LeaderBoardDataModel.h"

@interface LeaderBoardListView () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *leaderBoardTable;

@end


@implementation LeaderBoardListView

#pragma mark - setter methods

- (instancetype) init {

    if(self = [super init]) {
        
        [self addSubview:self.leaderBoardTable];
        [self addConstrains];
        self.backgroundColor = [UIColor clearColor];

    }
    
    return self;
    
}

-(UITableView *)leaderBoardTable
{
    if(!_leaderBoardTable) {
        
        _leaderBoardTable = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _leaderBoardTable.dataSource = self;
        _leaderBoardTable.delegate = self;
        _leaderBoardTable.backgroundColor = [UIColor clearColor];
        _leaderBoardTable.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _leaderBoardTable;
}

- (void)addConstrains {
   
    NSDictionary *views = @{@"leaderBoardTable" : _leaderBoardTable};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leaderBoardTable]|" options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leaderBoardTable]|" options:0 metrics:nil views:views]];
}

- (void)setLeaderBoardDataSource:(NSArray *)leaderBoardDataSource {
    
    
    _leaderBoardDataSource = leaderBoardDataSource;
    [_leaderBoardTable reloadData];
}


#pragma mark- table view delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _leaderBoardDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    
    
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    
        if (_leaderBoardDataSource.count && _leaderBoardDataSource.count > indexPath.row)
        {
            LeaderBoardDataModel *leaderBoardDataModel = [self.leaderBoardDataSource objectAtIndex:indexPath.row];
            
            if(leaderBoardDataModel.userRank)
            {
                NSString *rank = leaderBoardDataModel.userRank;
                cell.rankLabel.text = rank;
                cell.rankLabel.textColor = [UIColor darkTextColor];
            }
    
            if(leaderBoardDataModel.userName)
            {
                NSString *userName = leaderBoardDataModel.userName;
    
                cell.nameLabel.text = userName;
                cell.nameLabel.textColor = [UIColor darkTextColor];

            }
    
            if(leaderBoardDataModel.userSalesTargetAmount)
            {
                double targetAmount = [leaderBoardDataModel.userSalesTargetAmount doubleValue];
                NSString *targetAmountStringVal = [NSString stringWithFormat:@"%.2f", targetAmount];
                cell.amountLabel.text = targetAmountStringVal;
                cell.amountLabel.textColor = [UIColor darkTextColor];

            }
            
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}



@end
