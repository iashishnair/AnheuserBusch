//
//  DashBoardViewController.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 14/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashBoardViewController : UIViewController<UITableViewDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topChartView;

@property (weak, nonatomic) IBOutlet UILabel *midLabel;

@property (weak, nonatomic) IBOutlet UITableView *bottomTableView;

@property (weak, nonatomic) IBOutlet UIButton *calendarButton;

@property (weak, nonatomic) IBOutlet UILabel *achievmentsLabel;

@end
