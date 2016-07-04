//
//  CStorePLTableViewCell.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 30/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//
#import "NSLayoutConstraint+LayoutConstraintHelper.h"
#import "CStorePLTableViewCell.h"
#import "Constants.h"

@interface CStorePLTableViewCell ()

@property (nonatomic, strong) UILabel *incentiveTitleLabel;
@property (nonatomic, strong) UIView *seperatorView;
@property (nonatomic, strong) UIView *customBackgroundView;

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


#pragma mark - Public Method

-(void)setKpiName:(NSString *)kpiName {
    
    _kpiName = kpiName;
    
    if(![NSString isNULLString:_kpiName])
        self.incentiveTitleLabel.text = kpiName;
}

#pragma mark - Private Method

- (void) createUI {
    
    self.backgroundView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.customBackgroundView];
    [self.customBackgroundView addSubview:self.seperatorView];
    [self.customBackgroundView addSubview:self.incentiveTitleLabel];
    [self.customBackgroundView addSubview:self.incentiveBarChartView];
    [self addConstrainsts];
}

- (void)addConstrainsts {
    
    NSDictionary *views = @{@"customBackgroundView": self.customBackgroundView,
                            @"seperatorView": self.seperatorView,
                            @"incentiveTitleLabel": self.incentiveTitleLabel,
                            @"incentiveBarChartView": self.incentiveBarChartView};
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customBackgroundView]|" options:0 metrics:views views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[customBackgroundView]-|" options:0 metrics:views views:views]];

    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[incentiveTitleLabel]-|" options:0 metrics:views views:views]];
    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[seperatorView]-|" options:0 metrics:views views:views]];

    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[incentiveBarChartView]-|" options:0 metrics:views views:views]];
    
    [self.customBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[incentiveTitleLabel]-[seperatorView(2)]-16-[incentiveBarChartView(20)]" options:0 metrics:views views:views]];
    
}


- (UIView *)customBackgroundView {
    
    if(!_customBackgroundView) {
        
        _customBackgroundView = [UIView new];
        _customBackgroundView.backgroundColor = [UIColor redColor];
        _customBackgroundView.translatesAutoresizingMaskIntoConstraints =  NO;
        _customBackgroundView.backgroundColor = [UIColor colorWithWhite:.7 alpha:.8];
    }
    
    return _customBackgroundView;
}
- (UILabel *)incentiveTitleLabel {
    
    if(!_incentiveTitleLabel) {
        _incentiveTitleLabel = [UILabel new];
        _incentiveTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _incentiveTitleLabel;
}

- (UIView *)incentiveBarChartView {
    
    if(!_incentiveBarChartView) {
        
        _incentiveBarChartView = [[IncentivesProgressBarView alloc]initWithBarType:1];
        _incentiveBarChartView.translatesAutoresizingMaskIntoConstraints =  NO;
    }
    
    return _incentiveBarChartView;
}
- (UIView *)seperatorView {
    
    if(!_seperatorView) {
        
        _seperatorView = [UIView new];
        _seperatorView.translatesAutoresizingMaskIntoConstraints =  NO;
        _seperatorView.backgroundColor = [UIColor blackColor];
    }
    
    return _seperatorView;
}
@end
