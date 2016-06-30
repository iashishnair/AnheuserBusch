//
//  CStorePLTableViewCell.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//
#import "NSLayoutConstraint+LayoutConstraintHelper.h"

#import "CStorePLTableViewCell.h"

@interface CStorePLTableViewCell ()

@property (nonatomic, strong) UILabel *incentiveTitleLabel;
@property (nonatomic, strong) UIView *incentiveBarChartView;

@end

@implementation CStorePLTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Private Method

- (void) createUI {
    
    [self.contentView addSubview:self.incentiveTitleLabel];
    [self.contentView addSubview:self.incentiveBarChartView];
    
    [self addConstrainsts];

}

- (void)addConstrainsts {
    
    NSDictionary *views = @{@"incentiveTitleLabel": self.incentiveTitleLabel,
                        @"incentiveBarChartView": self.incentiveBarChartView};
    
    [NSLayoutConstraint sameWidth:self.incentiveTitleLabel toItem:self.contentView];
    [NSLayoutConstraint sameWidth:self.incentiveBarChartView toItem:self.contentView];

    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[incentiveTitleLabel]-[incentiveTitleLabel]-|" options:0 metrics:views views:views]];

}


-(UILabel *)incentiveTitleLabel {
    
    if(!_incentiveTitleLabel) {
        _incentiveTitleLabel = [UILabel new];
        _incentiveTitleLabel.text = @"Text";
        _incentiveTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _incentiveTitleLabel;
}

- (UIView *)incentiveBarChartView {
    
    if(!_incentiveBarChartView) {
        
        _incentiveBarChartView = [UIView new];
        _incentiveBarChartView.backgroundColor = [UIColor redColor];
        _incentiveBarChartView.translatesAutoresizingMaskIntoConstraints =  NO;
    }
    
    return _incentiveBarChartView;
}
@end
