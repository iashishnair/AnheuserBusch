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

@interface WorkProfileViewController ()

@property (strong, nonatomic) AchievmentsChartView *chartView;
@property (strong, nonatomic) UserProfileView *userProfileView;

@end

@implementation WorkProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _chartView = [AchievmentsChartView new];
    _chartView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _userProfileView = [UserProfileView new];
    _userProfileView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_chartView];
    [self.view addSubview:_userProfileView];
    [self addConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addConstraints {
    
    if(!_chartView) return;
    
    NSDictionary *views = @{@"chartView": _chartView,
                            @"userProfileView": _userProfileView
                        };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[chartView]-180-|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[userProfileView]|" options:0 metrics:nil views:views]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[userProfileView(250)]-5-[chartView(300)]" options:0 metrics:nil views:views]];

    
    
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
