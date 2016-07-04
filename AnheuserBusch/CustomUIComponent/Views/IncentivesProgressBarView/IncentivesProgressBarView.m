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
@property (nonatomic, strong) NSLayoutConstraint *progressBarViewWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *progressAmountLabelWidthConstraint;

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
	
	if(!_barBackgroundView) {
		_barBackgroundView = [UIView new];
		_barBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return _barBackgroundView;
}

- (UIView *)progressBarView {
	
	if(!_progressBarView) {
		_progressBarView = [UIView new];
		_progressBarView.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return _progressBarView;
}

- (UILabel *)progressAmountLabel {
	
	if(!_progressAmountLabel) {
		_progressAmountLabel = [UILabel new];
		_progressAmountLabel.font = [UIFont systemFontOfSize:10.0f];
		_progressAmountLabel.textAlignment = NSTextAlignmentRight;
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
	
 NSDictionary *dict = @{@"barBackgroundView": self.barBackgroundView,
						@"progressBarView": self.progressBarView,
						@"progressAmountLabel": self.progressAmountLabel
						};
	
	
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[barBackgroundView]|" options:0 metrics:nil views:dict]];
	
		  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressBarView]" options:0 metrics:nil views:dict]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressAmountLabel]" options:0 metrics:nil views:dict]];

	
	
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[progressBarView]|" options:0 metrics:nil views:dict]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[progressAmountLabel]|" options:0 metrics:nil views:dict]];

	
//	[self addConstraint:[NSLayoutConstraint height:self.progressBarView toItem:self.barBackgroundView multiplier:0.5 constant:1]];
	
	[NSLayoutConstraint verticallyCenter:self.progressBarView  toItem:self];
	
    [NSLayoutConstraint verticallyCenter:self.barBackgroundView  toItem:self];

	_progressBarViewWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:0 constant:1];
    
	_progressAmountLabelWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:0 constant:1];

	
	[self addConstraint:_progressBarViewWidthConstraint];
	[self addConstraint:_progressAmountLabelWidthConstraint];

}


- (void)updateProgressBarViewWidthConstraint:(float)multiplier {

	
	if(_progressBarViewWidthConstraint)
	 [self removeConstraint:_progressBarViewWidthConstraint];

	
	if(_progressAmountLabelWidthConstraint) {
		[self removeConstraint:_progressAmountLabelWidthConstraint];
	}
	
	
	_progressBarViewWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:multiplier constant:1];
	[self addConstraint:_progressBarViewWidthConstraint];
	
	
	_progressAmountLabelWidthConstraint = [NSLayoutConstraint width:self.progressAmountLabel toItem:self.barBackgroundView multiplier:multiplier constant:1];
	[self addConstraint:_progressAmountLabelWidthConstraint];
	
	
	_progressAmountLabel.text = [NSString stringWithFormat:@"%.2f%@",multiplier*100,@"%"];
	
	[self setNeedsUpdateConstraints];
		//[self setNeedsLayout];
		//[self layoutIfNeeded];
	
}

#pragma mark - Public Method

- (void)setProgressAmount:(NSNumber *)progressAmount {
	
	_progressAmount = progressAmount;
	
	
	if(!_progressBarViewWidthConstraint || !self.maxRange || !self.minRange) return;
	
	float multiplier = _progressAmount.floatValue / (self.maxRange.floatValue - self.minRange.floatValue);
	
	
	multiplier = MAX(0, multiplier);
	multiplier = MIN(100, multiplier);
	
	
	[self updateProgressBarViewWidthConstraint:multiplier];
}

-(void)setProgressAmountInPercent:(NSNumber *)progressAmountInPercent {
	
	_progressAmountInPercent = progressAmountInPercent;
	
	[self updateProgressBarViewWidthConstraint:_progressAmountInPercent.floatValue];

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
