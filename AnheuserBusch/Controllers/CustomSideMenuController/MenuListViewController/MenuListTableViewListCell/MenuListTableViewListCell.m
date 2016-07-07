//
//  CustomMenuTableViewCell.m
//  CustomSideMenuExample
//
//  Created by Prsenjit Goswami on 28/06/16.
//  Copyright © 2016 Mobivery. All rights reserved.
//

#import "MenuListTableViewListCell.h"
#import "UIResponder+UIComponentUtility.h"
#import "Constants.h"
#import "UIView+Common.h"

@implementation MenuListTableViewListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
	
	
	if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
	
		[self configureUI];

	}
	return self;

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

- (void)configureUI {
	
	[self.contentView addSubview:self.menuIconimageView];
	[self.contentView addSubview:self.menuTitleLabel];
	[self.contentView addSubview:self.seperatorImageView];


	[self addConstraint];
}


-(void)addConstraint {
	
	
	NSDictionary *views = @{@"menuIconimageView": self.menuIconimageView,
							@"menuTitleLabel": self.menuTitleLabel,
							@"seperatorImageView": self.seperatorImageView,

							};
	[self.contentView addConstraintsWithVisualFormat:@"H:|-[menuIconimageView(40)]-[menuTitleLabel]-|" options:0 metrics:nil views:views];
	[self.contentView addConstraintsWithVisualFormat:@"H:|[seperatorImageView]|" options:0 metrics:nil views:views];
	[self.contentView addConstraintsWithVisualFormat:@"V:[seperatorImageView(1)]|" options:0 metrics:nil views:views];

	
	[self.contentView addConstraintsWithVisualFormat:@"V:|-[menuIconimageView]-|" options:0 metrics:nil views:views];
	
	[self.contentView addConstraint:[NSLayoutConstraint verticallyCenter:self.menuTitleLabel toItem:self.menuIconimageView]];
}
- (UIImageView *)menuIconimageView {
	
	if(!_menuIconimageView) {
		
		_menuIconimageView = [UIImageView initWithImage:nil];
		_menuIconimageView.backgroundColor = [UIColor redColor];
		
	}
	return _menuIconimageView;
}

- (UIImageView *)seperatorImageView {
	
	if(!_seperatorImageView) {
		
		_seperatorImageView = [UIImageView initWithImage:nil];
		_seperatorImageView.backgroundColor = [UIColor blackColorABI];
		
	}
	return _seperatorImageView;
}


- (UILabel *)menuTitleLabel {
	
	if(!_menuTitleLabel) {
		
		_menuTitleLabel = [UILabel labelWithText:@"" textColor:nil textFont:nil textAlignment:0 numberOfLines:1 backgroundColor:nil];
		
	}
	return _menuTitleLabel;
}


- (void)updateOnSelection:(BOOL)selected {
    
  
    _menuTitleLabel.textColor = selected ? SLIDE_MENU_SELECTED_LABEL_TEXT_COLOR :SLIDE_MENU_DESELECTED_LABEL_TEXT_COLOR;
   
    _menuTitleLabel.font =  selected? SLIDE_MENU_SELECTED_LABEL_TEXT_FONT : SLIDE_MENU_DESELECTED_LABEL_TEXT_FONT;
   
    self.contentView.backgroundColor = selected ? SLIDE_MENU_SELECTED_CELL_BG_COLOR :SLIDE_MENU_DESELECTED_CELL_BG_COLOR;
}

@end
