//
//  CustomMenuTableViewCell.m
//  CustomSideMenuExample
//
//  Created by Prsenjit Goswami on 28/06/16.
//  Copyright © 2016 Mobivery. All rights reserved.
//

#import "MenuListTableViewListCell.h"
#include "Constants.h"

@implementation MenuListTableViewListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

- (void)updateOnSelection:(BOOL)selected {
    
  
    _menuTitleLabel.textColor = selected ? SLIDE_MENU_SELECTED_LABEL_TEXT_COLOR :SLIDE_MENU_DESELECTED_LABEL_TEXT_COLOR;
   
    _menuTitleLabel.font =  selected? SLIDE_MENU_SELECTED_LABEL_TEXT_FONT : SLIDE_MENU_DESELECTED_LABEL_TEXT_FONT;
   
    self.backgroundColor = selected ? SLIDE_MENU_SELECTED_CELL_BG_COLOR :SLIDE_MENU_DESELECTED_CELL_BG_COLOR;
}

@end
