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
#import "AnnouncementDataModel.h"

@interface AnnouncementsViewController () <GUITabPagerDataSource, GUITabPagerDelegate> {
    
    NSArray *viewControllers;
  // NSArray *segmentTitles;
}

@property (strong, nonatomic) GUITabPagerViewController *customPageManagerViewController;
@property (nonatomic,strong) AnnouncementsDetailViewController *customViewConroller;
@property (weak, nonatomic) IBOutlet UIView *pageViewControllerContainerView;
@property (nonatomic, strong) NSMutableArray *segmentTitles;
@property (nonatomic, assign) NSUInteger index ;

@end
@implementation AnnouncementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    KPIRankingViewController *kPIRankingViewController=(KPIRankingViewController *)[UIViewController instantiateViewControllerWithIdentifier:@"KPIRankingViewController"];
//    
//    kPIRankingViewController.view.frame = self.view.bounds;
//    [self.view addSubview:kPIRankingViewController.view];
//    [self addChildViewController:kPIRankingViewController];
//    [kPIRankingViewController didMoveToParentViewController:self];
    self.index  = 0;
    
   //segmentTitles = @[@"a", @"b", @"c" , @"d"];
    self.segmentTitles = [super announcementDataSourcePopulate];
    
    [self customPageManagerViewController];
    [self configureUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    _customPageManagerViewController = nil;
    _customViewConroller = nil;
}

#pragma mark - Private Method

- (void) configureUI {
    
    [self.pageViewControllerContainerView addSubview:self.customPageManagerViewController.view];
    
//    CGRect rect = _pageViewControllerContainerView.bounds;
//    self.customPageManagerViewController.view.frame = rect;
    
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
        
        //       _customPageManagerViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [_customPageManagerViewController setDataSource:self];
        [_customPageManagerViewController setDelegate:self];
    }
    
    return _customPageManagerViewController;
}



#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
    return [self.segmentTitles count];
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    
    return [[AnnouncementsDetailViewController alloc] init];
}

-(AnnouncementsDetailViewController *)customViewConroller {
    
    if(!_customViewConroller) {
        
        _customViewConroller = [[AnnouncementsDetailViewController alloc]init];

      //  AnnouncementDataModel *datamodel = [self.segmentTitles objectAtIndex:self.index];
        AnnouncementDataModel *datamodel = [self.segmentTitles objectAtIndex:4];
        _customViewConroller.incentiveName = datamodel.incentiveName;
    }
    
    return  _customViewConroller;
    
}
// Implement either viewForTabAtIndex: or titleForTabAtIndex:
//- (UIView *)viewForTabAtIndex:(NSInteger)index {
//  return <#UIView#>;
//}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    
    AnnouncementDataModel *item = _segmentTitles[index];
  
    return   item.incentiveName;
}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 0.0f;
}

- (UIColor *)tabColor {
    // Default: [UIColor orangeColor];
    return [UIColor blackColor];
}

- (UIColor *)tabBackgroundColor {
    // Default: [UIColor colorWithWhite:0.95f alpha:1.0f];
    return [UIColor lightTextColor];
}

- (UIFont *)titleFont {
    // Default: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0f];
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
}

- (UIColor *)titleColor {
    // Default: [UIColor blackColor];
    return [UIColor darkGrayColor];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
    self.index  = index;

    //    NSLog(@"Will transition from tab %ld to %ld", [self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    
    
    self.index  = index;

    //    NSLog(@"Did transition to tab %ld", (long)index);
}











@end
