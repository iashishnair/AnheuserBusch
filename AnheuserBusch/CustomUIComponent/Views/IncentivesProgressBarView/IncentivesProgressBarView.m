
//
//  IncentivesProgressBarView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 29/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "IncentivesProgressBarView.h"
#import "NSLayoutConstraint+LayoutConstraintHelper.h"

#define BAR_CORNER_RADIUS 10.0f

@interface IncentivesProgressBarView  ()

@property (nonatomic, strong) UIView *barBackgroundView;
@property (nonatomic, strong) UIView *progressBarView;
@property (nonatomic, strong) UILabel *descriptionTextLabel;
@property (nonatomic, strong) UILabel *unitTextLabel;

@property (nonatomic, strong) NSLayoutConstraint *progressBarViewWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *unitTextLabelWidthConstraint;
@property (nonatomic, assign) float multiplier;
@property (nonatomic, assign) NSInteger barType;


@end

@implementation IncentivesProgressBarView


- (instancetype)initWithBarType:(NSInteger)type {
    
    if(self == [super init]) {
        
        _barType = type;
        
        [self createUI];
    }
    
    return self;
}
- (instancetype)init {
    
    if(self == [super init]) {
        
        [self createUI];
        
    }
    return self;
}

-(void)dealloc {
    
    _barBackgroundView = nil;
    _progressBarView = nil;
    _unitTextLabel = nil;
}

#pragma mark - Private Method

- (UIView *)barBackgroundView {
    
    if(!_barBackgroundView) {
        _barBackgroundView = [UIView new];
        _barBackgroundView.layer.cornerRadius = BAR_CORNER_RADIUS;
        _barBackgroundView.clipsToBounds = YES;
        _barBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _barBackgroundView;
}

- (UIView *)progressBarView {
    
    if(!_progressBarView) {
        _progressBarView = [UIView new];
        _progressBarView.layer.cornerRadius = BAR_CORNER_RADIUS;
        _progressBarView.clipsToBounds = YES;
        _progressBarView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _progressBarView;
}

-(UILabel *)descriptionTextLabel {
  
    if(!_descriptionTextLabel) {
        
        
        _descriptionTextLabel = [UILabel new];
        _descriptionTextLabel.textAlignment = NSTextAlignmentRight;
        _descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _descriptionTextLabel;
    
}
- (UILabel *)unitTextLabel {
    
    if(!_unitTextLabel) {
        _unitTextLabel = [UILabel new];
        _unitTextLabel.font = [UIFont systemFontOfSize:10.0f];
        _unitTextLabel.textAlignment = NSTextAlignmentRight;
        _unitTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _unitTextLabel;
}

- (void)createUI {
    [self addSubview:self.unitTextLabel];
    [self addSubview:self.descriptionTextLabel];
    [self addSubview:self.barBackgroundView];
    [self.barBackgroundView addSubview:self.progressBarView];
    [self addConstrains];
}

- (void)addConstrains {
    
    NSDictionary *dict = @{ @"unitTextLabel": self.unitTextLabel,
                            @"descriptionTextLabel": self.descriptionTextLabel,
                            @"barBackgroundView": self.barBackgroundView,
                           @"progressBarView": self.progressBarView,
                          
                           };
    

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[descriptionTextLabel]|" options:0 metrics:nil views:dict]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[unitTextLabel]|" options:0 metrics:nil views:dict]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[barBackgroundView]|" options:0 metrics:nil views:dict]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressBarView]|" options:0 metrics:nil views:dict]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[descriptionTextLabel]-1-[unitTextLabel]-5-[barBackgroundView(25)]|" options:0 metrics:nil views:dict]];
    
    // Same CenterY
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.barBackgroundView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.progressBarView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint height:self.progressBarView toItem:self.barBackgroundView  multiplier:1 constant:0]];

_progressBarViewWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:.5 constant:0];
  [self addConstraint:_progressBarViewWidthConstraint];
    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[descriptionTextLabel][unitTextLabel][progressBarView]|" options:0 metrics:nil views:dict]];


    
}


//- (void)_addConstrains {
//    
//    NSDictionary *dict = @{@"barBackgroundView": self.barBackgroundView,
//                           @"progressBarView": self.progressBarView,
//                           @"unitTextLabel": self.unitTextLabel
//                           };
//    
//    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[barBackgroundView]|" options:0 metrics:nil views:dict]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[unitTextLabel]" options:0 metrics:nil views:dict]];
//    
//    
//    
//    switch (self.barType) {
//      
//        case 0:
//            
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[progressBarView]" options:0 metrics:nil views:dict]];
//
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[barBackgroundView]|" options:0 metrics:nil views:dict]];
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[progressBarView]-4-|" options:0 metrics:nil views:dict]];
//
//            break;
//            
//        case 1:
//            
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressBarView]" options:0 metrics:nil views:dict]];
//
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[barBackgroundView(4)]" options:0 metrics:nil views:dict]];
//            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[progressBarView]|" options:0 metrics:nil views:dict]];
//
//            
//            break;
//       
//        default:
//            break;
//    }
//    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[unitTextLabel]|" options:0 metrics:nil views:dict]];
//    
//    
//    //[self addConstraint:[NSLayoutConstraint height:self.progressBarView toItem:self.barBackgroundView multiplier:0.5 constant:1]];
//    //[NSLayoutConstraint verticallyCenter:self.progressBarView  toItem:self];
//    
//    [NSLayoutConstraint verticallyCenter:self.barBackgroundView  toItem:self];
//    
//    _progressBarViewWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:0 constant:1];
//    
//    _unitTextLabelWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:0 constant:-10.0];
//    
//    
//    [self addConstraint:_progressBarViewWidthConstraint];
//    [self addConstraint:_unitTextLabelWidthConstraint];
//    
//}


- (void)updateProgressBarViewWidthConstraint:(float)multiplier {
    
    
    if(_progressBarViewWidthConstraint)
        [self removeConstraint:_progressBarViewWidthConstraint];
    
    
    if(_unitTextLabelWidthConstraint) {
        [self removeConstraint:_unitTextLabelWidthConstraint];
    }
    
    
    _progressBarViewWidthConstraint = [NSLayoutConstraint width:self.progressBarView toItem:self.barBackgroundView multiplier:multiplier constant:0];
    [self addConstraint:_progressBarViewWidthConstraint];
    
    
//    _unitTextLabelWidthConstraint = [NSLayoutConstraint width:self.unitTextLabel toItem:self.barBackgroundView multiplier:multiplier constant:-10];
//    [self addConstraint:_unitTextLabelWidthConstraint];
//    
//    
//    
    [self setNeedsUpdateConstraints];
    
}

- (void)setUnitName:(NSString *)unitName {
    
    _unitName = unitName;
    
    
    NSString *unitNameTemp = nil;
    
    if(self.unitName && [self.unitName isEqualToString:@"%"]) {
        
        unitNameTemp = [NSString stringWithFormat:@"%.2f%@", self.multiplier*100,self.unitName.length ? self.unitName :@""];
        
    } else {
        unitNameTemp = [NSString stringWithFormat:@"%.2f%@",self.progressAmount.floatValue,_unitName.length ? _unitName : @""];
        
    }
    
    _unitTextLabel.text = unitNameTemp;
    
    
}

#pragma mark - Public Method

- (void)setProgressAmount:(NSNumber *)progressAmount {
    
    _progressAmount = progressAmount;
    
    
    if(!_progressBarViewWidthConstraint || !self.maxRange || !self.minRange) return;
    
    _multiplier = ( _progressAmount.floatValue) / (self.maxRange.floatValue - self.minRange.floatValue);
    
    _multiplier = MAX(0,  _multiplier);
    _multiplier = MIN(1,  _multiplier);
    
    
    [self updateProgressBarViewWidthConstraint: _multiplier];
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



- (void)setUnitTextFont:(UIFont *)unitTextFont {
    
    _unitTextFont = unitTextFont;
    
    if(_unitTextLabel) {
        _unitTextLabel.font = _unitTextFont;
    }
}

- (void)setUnitTextColor:(UIColor *)unitTextColor {
    
    _unitTextColor = unitTextColor;
    
    if(_unitTextLabel) {
        _unitTextLabel.textColor = _unitTextColor;
    }
}

-(void)setDescriptionText:(NSString *)descriptionText {
   
    _descriptionText = descriptionText;
    
    if(_descriptionTextLabel) {
        
        _descriptionTextLabel.text = _descriptionText;
    }
    
}

- (void)setDescriptionTextFont:(UIFont *)descriptionTextFont {
    _descriptionTextFont = descriptionTextFont;
    
    if(_descriptionTextLabel) {
        _descriptionTextLabel.font = descriptionTextFont;
    }
}

- (void)setDescriptionTextColor:(UIColor *)descriptionTextColor {
    
    _descriptionTextColor = descriptionTextColor;
    
    if(_descriptionTextLabel) {
        _descriptionTextLabel.textColor = _descriptionTextColor;
    }
}
@end
