//
//  BaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "BaseViewController.h"
#import "PageHeaderView.h"
#import "Constants.h"
#import "VKSideMenu.h"

#import "UIViewController+CurrentPageIndex.h"
#import "LoginViewController.h"
#import "LeaderBoardViewController.h"
#import "DashBoardViewController.h"
#import "ContainerPageViewController.h"

@interface BaseViewController () <PageHeaderViewDelegate, VKSideMenuDelegate,  VKSideMenuDataSource, UIPageViewControllerDataSource>

@property (strong, nonatomic) PageHeaderView *headerView;
@property (strong, nonatomic) VKSideMenu *menuLeft;
@property (strong, nonatomic) ContainerPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray *activeViewControllers;
@property (assign, nonatomic) NSUInteger currentPageIndex;
@property (strong, nonatomic) NSArray *menuDataSource;

@end

@implementation BaseViewController



#pragma mark - ViewController Life Cycle


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureUI];
}


#pragma mark - Private Method

- (void)configureUI {
    
    
    self.currentPageIndex = -1;
    [self.view addSubview:self.headerView];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    self.pageViewController.view.backgroundColor = [UIColor purpleColor];
    [self moveToPageWithIndex:0];
    [self addConstrains];
    [self initialishedSlideView];
    
    
}


- (UIView *)headerView {
    
    if(!_headerView) {
        
        _headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PageHeaderView class]) owner:self options:nil] firstObject];
        _headerView.delegate = self;
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    
    return _headerView;
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"headerView": self.headerView,
                            @"pageViewControllerView": self.pageViewController.view};
    
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[headerView]|" options:0 metrics:nil views:views]];
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewControllerView]|" options:0 metrics:nil views:views]];
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[headerView(44)][pageViewControllerView]|" options:0 metrics:nil views:views]];
    
}

-(void)initialishedSlideView {
    
    self.menuLeft = [[VKSideMenu alloc] initWithWidth:220 andDirection:VKSideMenuDirectionLeftToRight];
    self.menuLeft.dataSource = self;
    self.menuLeft.delegate   = self;
}
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if (([self.activeViewControllers count] == 0) || (index >= [self.activeViewControllers count])) {
        return nil;
    }
    
    
    UIViewController *activeViewController = nil;
    
    if(self.activeViewControllers && index < self.activeViewControllers.count) {
        
        activeViewController = [self.activeViewControllers objectAtIndex:index];
        
        [self.headerView setPageTitle:self.menuDataSource[index]];

    }
    
    return activeViewController ? activeViewController :  nil;
}


- (void)moveToPageWithIndex:(NSUInteger)pageIndex {
    
    if(self.currentPageIndex == pageIndex) return;
    
    UIViewController *selectedViewController = [self viewControllerAtIndex:pageIndex];
    
    if(selectedViewController) {
        
        NSArray *viewControllers = @[selectedViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
        self.currentPageIndex = pageIndex;
    }
  
}



// MARK: Getter Method
- (NSMutableArray *)activeViewControllers {
    
    if(!_activeViewControllers) {
        
        _activeViewControllers = [[NSMutableArray alloc]init];
        
        LoginViewController *loginViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        loginViewController.pageIndex = 0;
        [_activeViewControllers addObject:loginViewController];
        
        DashBoardViewController *dashBoardViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        dashBoardViewController.pageIndex = 1;
        
        [_activeViewControllers addObject:dashBoardViewController];
        
        LeaderBoardViewController *leaderBoardViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LeaderBoardViewController"];
        leaderBoardViewController.pageIndex = 2;
        
        [_activeViewControllers addObject:leaderBoardViewController];
    }
    
    return _activeViewControllers;
}

- (UIPageViewController *)pageViewController {
    
    if(!_pageViewController) {
                
        _pageViewController = [[ContainerPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        
        if(_pageViewController) {
            
            _pageViewController.dataSource = self;
            
        }
        
        [_pageViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _pageViewController.doubleSided = YES;
        
    }
    
    return _pageViewController;
}

- (NSArray *)menuDataSource {
    
    if(!_menuDataSource) {
        
        _menuDataSource = @[@"Login",@"Dash Board",@"Leader Board"];
    }
    
    return _menuDataSource;
}


#pragma mark - PageHeaderViewDelegate

- (void)clickedMenuButton:(id)sender  {
    
    [self.menuLeft show];
    
}
- (void)clickedNotificationButton:(id)sender{
    
}


#pragma mark - VKSideMenuDataSource

-(NSInteger)numberOfSectionsInSideMenu:(VKSideMenu *)sideMenu
{
    return 1;
}

-(NSInteger)sideMenu:(VKSideMenu *)sideMenu numberOfRowsInSection:(NSInteger)section
{
    
    return self.menuDataSource.count;
}

-(VKSideMenuItem *)sideMenu:(VKSideMenu *)sideMenu itemForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    VKSideMenuItem *item = [VKSideMenuItem new];
    
    if (sideMenu == self.menuLeft)
    {
        
        item.title = [self.menuDataSource objectAtIndex:indexPath.row];
        
    }
    
    return item;
}

#pragma mark - VKSideMenuDelegate

-(void)sideMenu:(VKSideMenu *)sideMenu didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [NSObject performInMainThreadAfterDelay:0.3 completion:^{
        
        [self moveToPageWithIndex:indexPath.row];
        [self.headerView setPageTitle:self.menuDataSource[indexPath.row]];
    }];
 
    
}




#pragma mark - UIPageViewController Delegate

//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
//      viewControllerBeforeViewController:(UIViewController *)viewController {
//    return nil;
//    NSUInteger index = 0;
//    
//    if([viewController respondsToSelector:@selector(pageIndex)])
//    {
//        index = [viewController pageIndex];
//    }
//    
//    if ((index == 0) || (index == NSNotFound)) {
//        return nil;
//    }
//    
//    index--;
//    
//    self.currentPageIndex = index;
//    
//
//    
//    return [self viewControllerAtIndex:index];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    
//    return nil;
//    NSUInteger index = viewController.pageIndex;
//    
//    if (index == NSNotFound) {
//        return nil;
//    }
//    
//    index++;
//    self.currentPageIndex = index;
//
//    return [self viewControllerAtIndex:index];
//}
//
//
@end
