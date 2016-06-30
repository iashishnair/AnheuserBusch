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
@property (nonatomic, strong) UIView *customBackgroundView;
@property (nonatomic, strong) UIView *incentiveBarChartView;

@end

@implementation CStorePLTableViewCell

#pragma mark - Cell Life Cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    
    return self;
}

- (void)dealloc {
    
    _customBackgroundView = nil;
    _incentiveTitleLabel = nil;
    _incentiveBarChartView = nil;
}

#pragma mark - Private Method

- (void) createUI {
    
    self.backgroundView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.customBackgroundView];
    [self.customBackgroundView addSubview:self.incentiveTitleLabel];
    [self.customBackgroundView addSubview:self.incentiveBarChartView];
    [self addConstrainsts];
}

- (void)addConstrainsts {
    
    NSDictionary *views = @{@"customBackgroundView": self.customBackgroundView,
                            @"incentiveTitleLabel": self.incentiveTitleLabel,
                            @"incentiveBarChartView": self.incentiveBarChartView};
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[customBackgroundView]-16-|" options:0 metrics:views views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[customBackgroundView]-|" options:0 metrics:views views:views]];
    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[incentiveTitleLabel]-|" options:0 metrics:views views:views]];
    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[incentiveBarChartView]-|" options:0 metrics:views views:views]];
    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[incentiveTitleLabel]-[incentiveBarChartView]-16-|" options:0 metrics:views views:views]];
    
}

- (UIView *)customBackgroundView {
    
    
    if(!_customBackgroundView) {
        
        _customBackgroundView = [UIView new];
        _customBackgroundView.backgroundColor = [UIColor redColor];
        _customBackgroundView.translatesAutoresizingMaskIntoConstraints =  NO;
        self.customBackgroundView.layer.cornerRadius = 2.0f;
        self.customBackgroundView.backgroundColor = [UIColor colorWithWhite:.7 alpha:.8];
    }
    
    return _customBackgroundView;
}
- (UILabel *)incentiveTitleLabel {
    
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
