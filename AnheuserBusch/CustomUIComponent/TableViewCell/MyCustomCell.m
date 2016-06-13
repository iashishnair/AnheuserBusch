//
//  MyCustomCell.m
//  LeaderBoardScreen
//
//  Created by Prsenjit Goswami on 6/13/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import "MyCustomCell.h"
#import "LeaderBoardDataModel.h"
#import "Constants.h"

@implementation MyCustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Public Method 

- (void)reloadCell:(nullable LeaderBoardDataModel *)leaderBoardDataModel {
	
	if(!leaderBoardDataModel) return;
	
	
	if(leaderBoardDataModel.userRank)
		{
		NSString *rank = leaderBoardDataModel.userRank;
		self.rankLabel.text = rank;
		self.rankLabel.textColor = [UIColor darkTextColor];
		}
	
	if(leaderBoardDataModel.userName)
		{
		NSString *userName = leaderBoardDataModel.userName;
		
		self.nameLabel.text = userName;
		self.nameLabel.textColor = [UIColor darkTextColor];
		
		}
	
	if(leaderBoardDataModel.userSalesTargetAmount)
		{
		double targetAmount = [leaderBoardDataModel.userSalesTargetAmount doubleValue];
		NSString *targetAmountStringVal = [NSString stringWithFormat:@"%.2f", targetAmount];
		self.amountLabel.text = targetAmountStringVal;
		self.amountLabel.textColor = [UIColor darkTextColor];
		
		}

}
@end
