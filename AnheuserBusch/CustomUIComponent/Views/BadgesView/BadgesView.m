//
//  BadgesView.m
//  AnheuserBusch
//
//  Created by MM-iMac on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "BadgesView.h"
#import "UIView+Common.h"
#import "WorkProfileDataModel.h"


@interface BadgesView()

@property (nonatomic, strong) UIImageView *hi5BadgeImageView;
@property (nonatomic, strong) UIImageView *FirstIncentiveImageView;
@property (nonatomic, strong) UIImageView *SecondIncentiveImageView;
@property (nonatomic, strong) UIView *hi5BadgeView;
@property (nonatomic, strong) UIView *FirstIncentiveView;
@property (nonatomic, strong) UIView *SecondIncentiveView;
@property (nonatomic, strong) UILabel *hi5Points;
@property (nonatomic, strong) UILabel *FirstIncentivePoints;
@property (nonatomic, strong) UILabel *SecondIncentivePoints;

@end

@implementation BadgesView

- (instancetype)init {
    
    if(self == [super init]) {
        
        //self = [UserRankView loadViewFromNIB];
        
        self.backgroundColor = [UIColor magentaColor];
        [self configureUI];
    }
    
    return self;
}

#pragma mark- Private methods

-(void) configureUI {
    
    _hi5BadgeView = [UIView new];
    _hi5BadgeView.translatesAutoresizingMaskIntoConstraints = NO;
    _hi5BadgeView.backgroundColor = [UIColor yellowColor];
    
    _hi5BadgeImageView = [UIImageView new];
    _hi5BadgeImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _hi5BadgeImageView.backgroundColor = [UIColor whiteColor];
    
    _hi5Points = [UILabel new];
    _hi5Points.translatesAutoresizingMaskIntoConstraints = NO;
   _hi5Points.backgroundColor = [UIColor whiteColor];
    _hi5Points.font = [UIFont badgeNumberTextFont];
    _hi5Points.textAlignment = NSTextAlignmentCenter;
    
    _FirstIncentiveView = [UIView new];
    _FirstIncentiveView.translatesAutoresizingMaskIntoConstraints = NO;
    _FirstIncentiveView.backgroundColor = [UIColor yellowColor];
    
    _FirstIncentiveImageView = [UIImageView new];
     _FirstIncentiveImageView.translatesAutoresizingMaskIntoConstraints = NO;
     _FirstIncentiveImageView.backgroundColor = [UIColor whiteColor];
    
    _FirstIncentivePoints = [UILabel new];
    _FirstIncentivePoints.translatesAutoresizingMaskIntoConstraints = NO;
    _FirstIncentivePoints.backgroundColor = [UIColor whiteColor];
    _FirstIncentivePoints.font = [UIFont badgeNumberTextFont];
    _FirstIncentivePoints.textAlignment = NSTextAlignmentCenter;
    
    _SecondIncentiveView = [UIView new];
    _SecondIncentiveView.translatesAutoresizingMaskIntoConstraints = NO;
    _SecondIncentiveView.backgroundColor = [UIColor yellowColor];
    
    _SecondIncentivePoints = [UILabel new];
    _SecondIncentivePoints.translatesAutoresizingMaskIntoConstraints = NO;
    _SecondIncentivePoints.backgroundColor = [UIColor whiteColor];
    _SecondIncentivePoints.font = [UIFont badgeNumberTextFont];
    _SecondIncentivePoints.textAlignment = NSTextAlignmentCenter;
    
    _SecondIncentiveImageView = [UIImageView new];
    _SecondIncentiveImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _SecondIncentiveImageView.backgroundColor = [UIColor whiteColor];

    [_hi5BadgeView addSubview:_hi5Points];
    [_hi5BadgeView addSubview:_hi5Points];
    
    [_FirstIncentiveView addSubview:_FirstIncentivePoints];
    [_FirstIncentiveView addSubview:_FirstIncentivePoints];
    
    [_SecondIncentiveView addSubview:_SecondIncentivePoints];
    [_SecondIncentiveView addSubview:_SecondIncentivePoints];
    
    [self addSubview:_hi5BadgeView];
    [self addSubview:_FirstIncentiveView];
    [self addSubview:_SecondIncentiveView];
    
    [self addConstraintsToHi5BadgeModel];
    [self addConstraintsToFirstIncentiveViewModel];
    [self addConstraintsToSecondIncentiveViewModel];
    [self addConstraintsToView];

}

#pragma mark- Private Methods

-(void) addConstraintsToView {
    
    if(!_hi5BadgeView ||!_SecondIncentiveView ||!_FirstIncentiveView)
        return;
    
    NSDictionary *views = @{@"hi5BadgeView": _hi5BadgeView,
                            @"SecondIncentiveView": _SecondIncentiveView,
                            @"FirstIncentiveView": _FirstIncentiveView,
                            };
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[hi5BadgeView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[SecondIncentiveView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[FirstIncentiveView]-|" options:0 metrics:nil views:views]];
    
     [self addConstraint:[NSLayoutConstraint constraintWithItem:_hi5BadgeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_hi5BadgeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_SecondIncentiveView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_hi5BadgeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_FirstIncentiveView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[hi5Points(16)]-2-[hi5BadgeView]-10-[FirstIncentivePoints(16)]-2-[FirstIncentiveView]-10-[SecondIncentivePoints(16)]-2-[SecondIncentiveView]-25-|" options:0 metrics:nil views:views]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_FirstIncentiveView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_hi5BadgeView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_SecondIncentiveView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];

}

-(void)addConstraintsToHi5BadgeModel {
    
    if(!_hi5Points ||!_hi5BadgeView)
        return;
    NSDictionary *views = @{
                            @"hi5Points": _hi5Points,
                            @"hi5BadgeView": _hi5BadgeView
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[hi5Points]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[hi5BadgeView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[hi5Points(16)]-2-[hi5BadgeView]|" options:0 metrics:nil views:views]];
    
}

-(void)addConstraintsToFirstIncentiveViewModel {
    
    if(!_FirstIncentiveView ||!_FirstIncentivePoints)
        return;
    NSDictionary *views = @{
                            @"FirstIncentiveView": _FirstIncentiveView,
                            @"FirstIncentivePoints": _FirstIncentivePoints
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[FirstIncentiveView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[FirstIncentivePoints]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[FirstIncentivePoints(16)]-2-[FirstIncentiveView]|" options:0 metrics:nil views:views]];
    
}

-(void)addConstraintsToSecondIncentiveViewModel {
    
    if(!_SecondIncentiveView ||!_SecondIncentivePoints)
        return;
    NSDictionary *views = @{
                            @"SecondIncentiveView": _SecondIncentiveView,
                            @"SecondIncentivePoints": _SecondIncentivePoints
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[SecondIncentiveView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[SecondIncentivePoints]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[SecondIncentiveView(16)]-2-[SecondIncentivePoints]|" options:0 metrics:nil views:views]];
    
}


-(void)setBadgesDataModel:(WorkProfileDataModel *)badgesDataModel {
    
     _hi5Points.text = badgesDataModel.hi5BadgeNumber;
    _FirstIncentivePoints.text = badgesDataModel.firstIncentiveBadgeNumber;
     _SecondIncentivePoints.text = badgesDataModel.secondIncentiveBadgeNumber;
    
}

@end
