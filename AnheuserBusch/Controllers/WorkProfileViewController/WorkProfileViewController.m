//
//  WorkProfileViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 22/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "WorkProfileViewController.h"
#import "AchievmentsChartView.h"
#import "UserProfileView.h"
#import "BadgesView.h"
#import "WorkProfileDataModel.h"

@interface WorkProfileViewController ()

@property (strong, nonatomic) AchievmentsChartView *chartView;
@property (strong, nonatomic) UserProfileView *userProfileView;
@property (strong, nonatomic) BadgesView *badgesView;


@end

@implementation WorkProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self populateDataSource];
    [self configureUI];
    [self addConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark- Private methods

-(void)configureUI {
    
    _chartView = [AchievmentsChartView new];
    _chartView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _userProfileView = [UserProfileView new];
    _userProfileView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _badgesView = [BadgesView new];
    _badgesView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_chartView];
    [self.view addSubview:_userProfileView];
    [self.view addSubview:_badgesView];
}

-(void)addConstraints {
    
    if(!_chartView) return;
    
    NSDictionary *views = @{@"chartView": _chartView,
                            @"userProfileView": _userProfileView,
                            @"badgesView": _badgesView
                        };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[chartView]-180-|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[userProfileView]|" options:0 metrics:nil views:views]];
    
      [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[badgesView]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[userProfileView(120)][badgesView(100)][chartView(250)]" options:0 metrics:nil views:views]];

    
    
}

-(void)populateDataSource {
    
    WorkProfileDataModel *dataModel = [WorkProfileDataModel new];
    _badgesView = [BadgesView new];

    dataModel.Rank = @"#2";
    dataModel.Name = @"John Peterson";
    dataModel.hi5BadgeNumber = @"1";
    dataModel.firstIncentiveBadgeNumber = @"4";
    dataModel.secondIncentiveBadgeNumber =@"1";
    dataModel.IncentiveSubgroupHeading = @"Large Format";
    dataModel.IncentiveSubgroupRank = @"#6";
    dataModel.IncentiveSubgroupPoints = @"55 points";
    dataModel.IncentiveSubgroupAmount = @"$320,541.00";
    dataModel.IncentiveSubgroupPercentage = @"92%";
    
    _badgesView.badgesDataModel = [[WorkProfileDataModel alloc]init];
    
    _badgesView.badgesDataModel = dataModel;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
