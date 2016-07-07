//
//  MVYMenuViewController.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MenuListViewControllerDelegate <NSObject>

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MenuListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (nonatomic, strong)  NSDictionary *userInfoDict;
@property(nonatomic, weak) id <MenuListViewControllerDelegate> delegate;

-(void)reloadMenuList;
@end
