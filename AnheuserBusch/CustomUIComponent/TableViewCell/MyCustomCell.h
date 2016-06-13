//
//  MyCustomCell.h
//  LeaderBoardScreen
//
//  Created by Prsenjit Goswami on 6/13/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeaderBoardDataModel;

@interface MyCustomCell : UITableViewCell

@property (strong, nonatomic, nonnull) IBOutlet UILabel *rankLabel;
@property (strong, nonatomic, nonnull) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic, nonnull) IBOutlet UILabel *amountLabel;

-(void) reloadCell:(nullable LeaderBoardDataModel *)leaderBoardDataModel;

@end
