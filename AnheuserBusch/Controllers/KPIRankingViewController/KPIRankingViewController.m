//
//  KPIRankingViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "KPIRankingViewController.h"
#import "PageItemViewController.h"
#import "GUITabPagerViewController.h"

@interface KPIRankingViewController () <GUITabPagerDataSource, GUITabPagerDelegate> {
    
    NSArray *viewControllers;
    NSArray *segmentTitles;
}
@property (weak, nonatomic) IBOutlet UILabel *hintTextLabel;
@property (weak, nonatomic) IBOutlet UIView *pageViewControllerContainerView;
@property (strong, nonatomic) GUITabPagerViewController *customPageManagerViewController;
@end

@implementation KPIRankingViewController


- (void)awakeFromNib {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customPageManagerViewController];
    
    [self configureaUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

- (void) configureaUI {
    
    [self.pageViewControllerContainerView addSubview:self.customPageManagerViewController.view];
    
    CGRect rect = _pageViewControllerContainerView.bounds;
    rect.origin.x = 1;
    self.customPageManagerViewController.view.frame = rect;
    
    [self addConstrains];
    
    [self.customPageManagerViewController reloadData];
}



- (void)addConstrains {
    
    NSDictionary *views = @{@"customPageManagerViewController": self.customPageManagerViewController.view};
    
    [self.pageViewControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[customPageManagerViewController]-10-|" options:0 metrics:nil views:views]];
    
        [self.pageViewControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customPageManagerViewController]|" options:0 metrics:nil views:views]];
}

- (GUITabPagerViewController *)customPageManagerViewController{
    
    if(!_customPageManagerViewController) {
        PageItemViewController *viewController1 = [[PageItemViewController alloc] initWithTitle:@"Cstore/PL 1"];
        PageItemViewController *viewController2 = [[PageItemViewController alloc] initWithTitle:@"Large Format"];
        PageItemViewController *viewController3 = [[PageItemViewController alloc] initWithTitle:@"On Premises"];
        
        viewControllers = @[viewController1, viewController2, viewController3];
        
        //Segment titles
        segmentTitles = @[@"Cstore/PL 1", @"Large Format", @"On Premises"];

       
        _customPageManagerViewController = [[GUITabPagerViewController alloc] init];
        
//       _customPageManagerViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [_customPageManagerViewController setDataSource:self];
        [_customPageManagerViewController setDelegate:self];
    }
    
    return _customPageManagerViewController;
}



#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
    return viewControllers.count;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    
    return viewControllers[index];
}

// Implement either viewForTabAtIndex: or titleForTabAtIndex:
//- (UIView *)viewForTabAtIndex:(NSInteger)index {
//  return <#UIView#>;
//}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    return segmentTitles[index];
}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 50.0f;
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
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
}

- (UIColor *)titleColor {
    // Default: [UIColor blackColor];
    return [UIColor darkGrayColor];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
//    NSLog(@"Will transition from tab %ld to %ld", [self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
//    NSLog(@"Did transition to tab %ld", (long)index);
}



@end
