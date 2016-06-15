//
//  DashBoardViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "OnBoardingViewController.h"
#import "InternalViewController.h"

@interface OnBoardingViewController ()
@property (weak, nonatomic) IBOutlet UIView *pageControllerContainerView;
@property (weak, nonatomic) IBOutlet UIView *buttonContainerView;
@property (strong,nonatomic) NSMutableArray *activeViewControllers;
@property (strong, nonatomic) NSMutableArray *pageTitles;
@property (strong, nonatomic) NSMutableArray *pageImages;
@property (strong, nonatomic) NSMutableArray *pageHeadings;


@end

@implementation OnBoardingViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageTitles = [[NSMutableArray alloc]initWithObjects:@"First Page  First Page  First Page  First Page  First Page  First Page  First Page  First Page  First Page  First Page",@"Second Page",@"Third Page",@"Fourth Page", nil];
    self.pageImages = [[NSMutableArray alloc]initWithObjects:@"Page1.jpg",@"Page2.jpeg",@"Page3.png",@"Page4.png", nil];
    self.pageHeadings = [[NSMutableArray alloc]initWithObjects:@"Heading 1",@"Heading 2",@"Heading 3",@"Heading 4", nil];
    
    [self pagesDataSource];
    
    [self configureUI];
    
    
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)configureUI {
    
    
    //    [self addChildViewController:self.pageViewController];
    [self.pageControllerContainerView addSubview:self.pageViewController.view];
    //    [self.pageViewController didMoveToParentViewController:self];
    
    // [self addBottomView];
    
    // Add LayoutConstraint
    [self addConstrains];
    
    
    
}

- (void)addConstrains {
    
    if(!_pageViewController) return;
    
    NSDictionary *views = @{@"pageViewController": self.pageViewController.view
                            };
    
    [self.pageControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewController]|" options:0 metrics:nil views:views]];
    
    [self.pageControllerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[pageViewController]|" options:0 metrics:nil views:views]];
}

- (void)pagesDataSource {
    
    InternalViewController *internalViewController = [[InternalViewController alloc]init];
    
    
    
    
    if(internalViewController) {
        
        [self.activeViewControllers addObject:internalViewController];
    }
    
}

- (InternalViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    //    if (([self.activeViewControllers count] == 0) || (index >= [self.activeViewControllers count])) {
    //        return nil;
    //    }
    //
    //    UIViewController *activeViewController = nil;
    //
    //    if(self.activeViewControllers && index < self.activeViewControllers.count) {
    //
    //        activeViewController = [self.activeViewControllers objectAtIndex:index];
    //
    //        if(!activeViewController)
    //            return nil;
    //    }
    //
    //    return activeViewController;
    
    
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    InternalViewController *internalViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InternalViewController"];
    internalViewController.imageFile = self.pageImages[index];
    internalViewController.titleText = self.pageTitles[index];
    internalViewController.pageIndex = index;
    internalViewController.headingText = self.pageHeadings[index];
    
    return internalViewController;
    
}


- (UIPageViewController *)pageViewController {
    
    if(!_pageViewController) {
        
        _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
        
        if(_pageViewController) {
            
            _pageViewController.dataSource = self;
            
            //            if(_activeViewControllers && self.activeViewControllers.count) {
            //
            //                [_pageViewController setViewControllers:@[self.activeViewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
            //            }
            
            InternalViewController *startingViewController = [self viewControllerAtIndex:0];
            NSArray *viewControllers = @[startingViewController];
            [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
            
        }
        // TranslatesAutoresizingMaskIntoConstraints must be No when use NSLayoutConstraint
        [_pageViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _pageViewController.doubleSided = YES;
        
    }
    
    return _pageViewController;
}

-(NSMutableArray *)activeViewControllers {
    
    if(!_activeViewControllers) {
        
        _activeViewControllers = [[NSMutableArray alloc]init];
        
    }
    
    return _activeViewControllers;
}

#pragma mark - UIPageViewController Delegate

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((InternalViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((InternalViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    return [self viewControllerAtIndex:index];
}



@end
