//
//  CStorePLViewConroller.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "CStorePLViewConroller.h"
#import "CStorePLTableViewCell.h"
#import "KPIsDetailsDataModel.h"
#import "Constants.h"

@interface CStorePLViewConroller () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CStorePLViewConroller

#pragma mark - ViewController Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    _tableView = nil;
}

#pragma mark - 

-(void)setKpiDetsils:(NSArray *)kpiDetsils {
    
    _kpiDetsils = kpiDetsils && kpiDetsils.count ? kpiDetsils : nil;
    
    if(self.tableView)
        [self.tableView reloadData];

}

#pragma mark - Private Method

- (void)createUI {
    
    [self.view addSubview:self.tableView];
    [self addConstraints];
}

- (void)addConstraints {
    
    NSDictionary *views = @{@"tableView": self.tableView};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views]];
}

- (UITableView *)tableView {
    
    if(!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.separatorColor = [UIColor clearColor];
    }
    
    return _tableView;
}


#pragma mark - TableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.kpiDetsils.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* cellIdentifier =@"cellIdentifier";
    
    CStorePLTableViewCell *cell = (CStorePLTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        
        cell = [[CStorePLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    KPIsDetailsDataModel *kpisDetailsDataModel =  [NSArray objectFromArray:self.kpiDetsils atIndex:indexPath.row];
    
    if(kpisDetailsDataModel) {
        
        NSLog(@"%@",kpisDetailsDataModel);
        
        cell.kpiName = kpisDetailsDataModel.kpiName;
        
        cell.incentiveBarChartView.barBackGroundColor = [UIColor blueColor];
        cell.incentiveBarChartView.progressColor = [UIColor yellowColor];
        cell.incentiveBarChartView.minRange = kpisDetailsDataModel.minRange;
        cell.incentiveBarChartView.maxRange = kpisDetailsDataModel.maxRange;
        cell.incentiveBarChartView.progressAmount = kpisDetailsDataModel.progress;
        cell.incentiveBarChartView.unitName = kpisDetailsDataModel.progressUnit;

    }


    return cell;
}



@end
