//
//  PageBaseViewController.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface PageBaseViewController : UIViewController

@property (nonatomic, assign) BOOL isLeftBarButtonHidden;
@property (nonatomic, assign) BOOL showMenuButton;
@property (nonatomic, assign) BOOL showBackButton;

-(NSMutableArray *)announcementDataSourcePopulate;

@end
