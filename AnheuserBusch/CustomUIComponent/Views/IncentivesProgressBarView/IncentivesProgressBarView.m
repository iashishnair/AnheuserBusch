//
//  IncentivesProgressBarView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 29/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "IncentivesProgressBarView.h"
#import "NSLayoutConstraint+LayoutConstraintHelper.h"

@interface IncentivesProgressBarView  ()

@property (nonatomic, strong) UIView *barBackgroundView;
@property (nonatomic, strong) UIView *progressBarView;
@property (nonatomic, strong) UILabel *progressAmountLabel;
@property (nonatomic, strong) NSLayoutConstraint *progressWidthConstraint;

@end

@implementation IncentivesProgressBarView


- (instancetype)init {
    
    if(self == [super init]) {
        
        [self createUI];
    }
    return self;
}

-(void)dealloc {
    
    
}
#pragma mark - Private Method

- (UIView *)barBackgroundView {
    
    if(_barBackgroundView) {
        _barBackgroundView = [UIView new];
        _barBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _barBackgroundView;
}

- (UIView *)progressBarView {
    
    if(_progressBarView) {
        _progressBarView = [UIView new];
        _progressBarView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _progressBarView;
}

- (UILabel *)progressAmountLabel {
    
    if(_progressAmountLabel) {
        _progressAmountLabel = [UILabel new];
        _progressAmountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _progressAmountLabel;
}

- (void)createUI {
    
    [self addSubview:self.barBackgroundView];
    [self addSubview:self.progressBarView];
    [self addSubview:self.progressAmountLabel];
    [self addConstrains];
}

- (void)addConstrains {
    return;
    NSDictionary *dict = @{@"barBackgroundView": self.barBackgroundView,
                           @"progressBarView": self.progressBarView,
                           @"progressAmountLabel": self.progressAmountLabel};
    
    
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[barBackgroundView]-|" options:0 metrics:nil views:dict]];
    
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[progressBarView]-|" options:0 metrics:nil views:dict]];
    
    
    _progressWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:.5 constant:1];
    
}

#pragma mark - Public Method

- (void)setProgressAmount:(NSNumber *)progressAmount {
    
    _progressAmount = progressAmount;
}


- (void)setBarBackGroundColor:(UIColor *)barBackGroundColor {
    
    _barBackGroundColor = barBackGroundColor;
    self.barBackgroundView.backgroundColor = _barBackGroundColor;
}

- (void)setProgressColor:(UIColor *)progressColor {
    
    _progressColor = progressColor;
    self.progressBarView.backgroundColor = progressColor;
}

- (void)setIncentivesProgressBarViewModel:(IncentivesProgressBarViewModel *)incentivesProgressBarViewModel {
    
    _incentivesProgressBarViewModel = incentivesProgressBarViewModel;
    
    if(_incentivesProgressBarViewModel) {
        
        
    }
}

@end
