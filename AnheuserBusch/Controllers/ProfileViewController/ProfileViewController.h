//
//  ProfileViewController.h
//  AnheuserBusch
//
//  Created by MM-iMac on 27/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageBaseViewController.h"

@interface ProfileViewController : PageBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *incentiveTableView;

@end
