//
//  CustomMenuTableViewCell.h
//  CustomSideMenuExample
//
//  Created by Prsenjit Goswami on 28/06/16.
//  Copyright © 2016 Mobivery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuListTableViewListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *menuIconimageView;
@property (weak, nonatomic) IBOutlet UILabel *menuTitleLabel;
- (void)updateOnSelection:(BOOL)selected ;
@end
