//
//  KPIRankingViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "KPIRankingViewController.h"
#import "GUITabPagerViewController.h"
#import "CStorePLViewConroller.h"

@interface KPIRankingViewController () <GUITabPagerDataSource, GUITabPagerDelegate> {
    
    NSArray *viewControllers;
    NSArray *segmentTitles;
}


@property (strong, nonatomic) GUITabPagerViewController *tabPageViewController;
@property (strong, nonatomic) NSArray *kpiDetails;

@end

@implementation KPIRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    segmentTitles = @[@"Cstore/PL 1", @"Large Format", @"On Premises"];
    
    [self tabPageViewController];
    [self configureUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    _tabPageViewController = nil;
}
-(void)viewDidLayoutSubviews{
    
    
}
#pragma mark - Private Method

- (void) configureUI {
    
    self.title = _incentiveDataModel.incentiveName;
    
    [self addChildViewController:self.tabPageViewController];
    [self.view addSubview:self.tabPageViewController.view];
    [self didMoveToParentViewController:self.tabPageViewController];
    [self addConstrains];
    [self.tabPageViewController reloadData];
}


- (void)addConstrains {
    
    NSDictionary *views = @{@"tabPageViewController": self.tabPageViewController.view};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tabPageViewController]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tabPageViewController]|" options:0 metrics:nil views:views]];
}

- (GUITabPagerViewController *)tabPageViewController{
    
    if(!_tabPageViewController) {
        
        _tabPageViewController = [[GUITabPagerViewController alloc] init];
        _tabPageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [_tabPageViewController setDataSource:self];
        [_tabPageViewController setDelegate:self];
    }
    
    return _tabPageViewController;
}

- (CStorePLViewConroller *)customViewConroller {
    
    CStorePLViewConroller * customViewConroller = [[CStorePLViewConroller alloc]init];
    customViewConroller.kpiDetsils =  self.kpiDetails;
    return  customViewConroller;
}

#pragma mark - Public Method

-(void)setIncentiveDataModel:(IncentiveDataModel *)incentiveDataModel {
    
    _incentiveDataModel = incentiveDataModel;
}

- (NSArray*)kpiDetails {
    
    return self.incentiveDataModel.kpisDetails;
}

#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
    return 3;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    
    return [self customViewConroller];
}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    return segmentTitles[index];
}

- (UIColor *)tabColor {
    return [UIColor cyanColorABI];
}

- (UIColor *)tabBackgroundColor {
    return [UIColor defaultABIThemeBlueColor];
}

- (UIFont *)titleFont {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
}

- (UIColor *)titleColor {
    return [UIColor whiteColorABI];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
    //    NSLog(@"Will transition from tab %ld to %ld", [self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    //    NSLog(@"Did transition to tab %ld", (long)index);
}



@end
