//
//  AnnouncementsViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AnnouncementsViewController.h"
#import "Constants.h"
#import "KPIRankingViewController.h"
#import "GUITabPagerViewController.h"
#import "CStorePLViewConroller.h"
#import "AnnouncementsDetailViewController.h"
#import "AnnouncementsViewPresenter.h"
#import "AnnouncementDataModel.h"

@interface AnnouncementsViewController () <GUITabPagerDataSource, GUITabPagerDelegate> {
    NSArray *viewControllers;
}

@property (weak, nonatomic) IBOutlet UIView *pageViewControllerContainerView;
@property (nonatomic, strong) GUITabPagerViewController *customPageManagerViewController;
@property (nonatomic, strong) NSMutableArray *segmentTitles;
@property (nonatomic, assign) NSUInteger index ;
@property (nonatomic, strong) id <AnnouncementsViewProtocol> presenter;


@end
@implementation AnnouncementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.index  = 0;
    
    self.segmentTitles = [self.presenter announcementDataSourcePopulate];
    
    [self customPageManagerViewController];
    [self configureUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    _customPageManagerViewController = nil;
}

#pragma mark - Private Method

- (void) configureUI {
    
    [self.pageViewControllerContainerView addSubview:self.customPageManagerViewController.view];
    
    [self addConstrains];
    
    [self.customPageManagerViewController reloadData];
    
    [self.customPageManagerViewController selectTabbarIndex:self.index animation:YES];
    
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"customPageManagerViewController": self.customPageManagerViewController.view};
    
    [self.pageViewControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[customPageManagerViewController]-10-|" options:0 metrics:nil views:views]];
    
    [self.pageViewControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customPageManagerViewController]|" options:0 metrics:nil views:views]];
}

- (GUITabPagerViewController *)customPageManagerViewController{
    
    if(!_customPageManagerViewController) {
        
        _customPageManagerViewController = [[GUITabPagerViewController alloc] init];
        [_customPageManagerViewController setDataSource:self];
        [_customPageManagerViewController setDelegate:self];
    }
    
    return _customPageManagerViewController;
}

- (id <AnnouncementsViewProtocol>)presenter {
    
    if(!_presenter) {
        
        _presenter = [AnnouncementsViewPresenter new];
    }
    
    return _presenter;
}

#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
    return [self.segmentTitles count];
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    
    AnnouncementsDetailViewController *customViewConroller = [[AnnouncementsDetailViewController alloc]init];

    AnnouncementDataModel *datamodel = [NSArray objectFromArray:self.segmentTitles atIndex:index];
    
    if(datamodel) {
        
        customViewConroller.incentiveName = datamodel.incentiveName;
        customViewConroller.minsToGo = datamodel.minsText;
        customViewConroller.daysLeft = datamodel.daysText;
        customViewConroller.announcementText = datamodel.announcementText;
    }
   
    
    return  customViewConroller;
}


// Implement either viewForTabAtIndex: or titleForTabAtIndex:
//- (UIView *)viewForTabAtIndex:(NSInteger)index {
//  return <#UIView#>;
//}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    
    AnnouncementDataModel *item = _segmentTitles[index];
    
    return item.incentiveName;
}

- (CGFloat)tabHeight {
    return 0.0f;
}

- (UIColor *)tabColor {
    return [UIColor blackColor];
}

- (UIColor *)tabBackgroundColor {
    return [UIColor lightTextColor];
}

- (UIFont *)titleFont {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
}

- (UIColor *)titleColor {
    return [UIColor darkGrayColor];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
    self.index  = index;
  
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    
    
    self.index  = index;
    
}



@end
