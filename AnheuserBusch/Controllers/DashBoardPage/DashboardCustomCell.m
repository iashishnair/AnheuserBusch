//
//  DashboardCustomCell.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 14/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "DashboardCustomCell.h"
@class DashBoardDataModel;

@implementation DashboardCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateCell :(DashBoardDataModel *)dashBoardDataModel {
    
    if(dashBoardDataModel.taskTitle) {
        
        NSString *titleText = dashBoardDataModel.taskTitle;
        
        self.titleLabel.text = titleText;
    }
    
    self.circleImage.image = [UIImage imageNamed:@"taskCircle"];
    
    if(dashBoardDataModel.workStatus)
    {
        self.circleImage.image = [UIImage imageNamed:@"taskCircleComplete"];
    }
    else if(!dashBoardDataModel.workStatus) {
       self.circleImage.image = [UIImage imageNamed:@"taskCircle"];
    }
    
    if(dashBoardDataModel.taskDescription) {
        
        NSString *descriptionText = dashBoardDataModel.taskDescription;
        
        self.descriptionLabel.text = descriptionText;
    }
    
    if(dashBoardDataModel.taskDate) {
        
        NSString *dateText = dashBoardDataModel.taskDate;
        
        self.dateLabel.text = dateText;
    }
    
}

@end
