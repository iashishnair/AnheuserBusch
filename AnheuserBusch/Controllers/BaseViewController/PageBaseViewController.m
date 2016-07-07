//
//  PageBaseViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "PageBaseViewController.h"
#import "CustomSideMenuController.h"
#import "AnnouncementsViewController.h"
#import "AnnouncementDataModel.h"
#import "PageBaseViewPresenter.h"

@interface PageBaseViewController()

@property(strong, nonatomic)id<PageBaseViewProtocol>presenter;

@end

@implementation PageBaseViewController


#pragma mark - Viewcontroller Life Cycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor defaultPageBGColor];
	
	[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:[UIImage imageNamed:@"notification"]];

	
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
	
	[super viewWillDisappear:animated];

}

- (void)addLeftMenuButtonWithImage:(UIImage *)buttonImage {
	
	UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(toggleMenu)];
	self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)addRightMenuButtonWithImage:(UIImage *)buttonImage {
	
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(clickedNotificationButton)];
	self.navigationItem.rightBarButtonItem = menuButton;
}

- (void)commonHeaderWithLeftMenuButtonImage:(UIImage *)leftMenuButtonImage
					   rightMenuButtonImage:(UIImage *)rightMenuButtonImage {
	
	if(leftMenuButtonImage) {
		
		[self addLeftMenuButtonWithImage:leftMenuButtonImage];
	}
	
	if(rightMenuButtonImage) {
		
		[self addRightMenuButtonWithImage:rightMenuButtonImage];
	}
	
}

- (void)toggleMenu {
	
	[[self sideMenuController] toggleMenu];
}

- (void)clickedNotificationButton {
    
    AnnouncementsViewController *announcementsViewController = (AnnouncementsViewController *)[UIViewController instantiateViewControllerWithIdentifier:kStoryBoardIDAnnouncementsViewController];
   
    
    [self.navigationController pushViewController:announcementsViewController animated:YES];
    	
}

-(void)setShowMenuButton:(BOOL)showMenuButton {
	
	_showMenuButton = showMenuButton;

	[self commonHeaderWithLeftMenuButtonImage:[UIImage imageNamed:@"menu_icon"] rightMenuButtonImage:nil];
	
}
- (void)setShowBackButton:(BOOL)showBackButton {
	
	_showBackButton = showBackButton;
	
	self.navigationItem.leftBarButtonItem = nil;

}

//- (id <PageBaseViewProtocol>)presenter {
//    
//    if(!_presenter) {
//        
//        _presenter = [PageBaseViewPresenter new];
//    }
//    
//    return _presenter;
//}

-(NSMutableArray *)announcementDataSourcePopulate {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    for(int i = 0;i<10;i++)
    {
        AnnouncementDataModel *dataModel = [AnnouncementDataModel new];
        dataModel.incentiveName = [NSString stringWithFormat:@"Incentive %d",i+1];
        dataModel.minsText = [NSString stringWithFormat:@"%d mins to go",i+2];
        dataModel.daysText = [NSString stringWithFormat:@"Starting in %d days",i+1];
        dataModel.announcementText =[NSString stringWithFormat:@"I am Lorem Ipsum %d is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",i+1 ];
        
        [resultsArray addObject:dataModel];
    }
    return resultsArray;
}



@end
