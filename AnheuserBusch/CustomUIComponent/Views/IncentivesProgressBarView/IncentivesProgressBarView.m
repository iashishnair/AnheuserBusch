//
//  IncentivesProgressBarView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 29/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "IncentivesProgressBarView.h"

@interface IncentivesProgressBarView  ()

@property (nonatomic, strong) UIView *barBackgroundView;
@property (nonatomic, strong) UIView *barProgressiveView;
@property (nonatomic, strong) UILabel *progressAmountLabel;


@end

@implementation IncentivesProgressBarView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if(self == [super initWithCoder:aDecoder]) {
        
        
    }
    
    return self;
    
}


#pragma mark - Private Method

- (UIView *)barBackgroundView {
    
    if(_barBackgroundView) {
        _barBackgroundView = [UIView new];
        _barBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _barBackgroundView;
}



- (UIView *)barProgressiveView {
    
    if(_barProgressiveView) {
        _barProgressiveView = [UIView new];
        _barProgressiveView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _barProgressiveView;
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
    [self addSubview:self.barProgressiveView];
    [self bringSubviewToFront:self.barProgressiveView];
    [self addSubview:self.progressAmountLabel];
    [self addConstrains];


}

- (void)addConstrains {
    
    NSDictionary *dict = @{@"barBackgroundView": self.barBackgroundView,
                           @"barBackgroundView": self.barBackgroundView,
                           @"progressAmountLabel": self.progressAmountLabel};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[barBackgroundView]-|" options:0 metrics:nil views:dict]];
    
    
}

- (void)setProgressAmount:(NSNumber *)progressAmount {
    

}


@end
