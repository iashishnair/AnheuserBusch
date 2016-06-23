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

@property (nonatomic, strong) UIImageView *hi5BadgeView;
@property (nonatomic, strong) UIImageView *FirstIncentiveView;
@property (nonatomic, strong) UIImageView *SecondIncentiveView;
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
    
    _hi5BadgeView = [UIImageView new];
    _hi5BadgeView.translatesAutoresizingMaskIntoConstraints = NO;
    _hi5BadgeView.backgroundColor = [UIColor whiteColor];
    
    _hi5Points = [UILabel new];
    _hi5Points.translatesAutoresizingMaskIntoConstraints = NO;
   _hi5Points.backgroundColor = [UIColor whiteColor];
   
    _hi5Points.font = [UIFont badgeNumberTextFont];
    _hi5Points.textAlignment = NSTextAlignmentCenter;
    
    _FirstIncentiveView = [UIImageView new];
     _FirstIncentiveView.translatesAutoresizingMaskIntoConstraints = NO;
     _FirstIncentiveView.backgroundColor = [UIColor whiteColor];
    
    _FirstIncentivePoints = [UILabel new];
    _FirstIncentivePoints.translatesAutoresizingMaskIntoConstraints = NO;
    _FirstIncentivePoints.backgroundColor = [UIColor whiteColor];
    
    _FirstIncentivePoints.font = [UIFont badgeNumberTextFont];
    _FirstIncentivePoints.textAlignment = NSTextAlignmentCenter;
    
    _SecondIncentivePoints = [UILabel new];
    _SecondIncentivePoints.translatesAutoresizingMaskIntoConstraints = NO;
    _SecondIncentivePoints.backgroundColor = [UIColor whiteColor];
   
    _SecondIncentivePoints.font = [UIFont badgeNumberTextFont];
    _SecondIncentivePoints.textAlignment = NSTextAlignmentCenter;
    
    _SecondIncentiveView = [UIImageView new];
    _SecondIncentiveView.translatesAutoresizingMaskIntoConstraints = NO;
    _SecondIncentiveView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_hi5Points];
    [self addSubview:_hi5BadgeView];
    [self addSubview:_FirstIncentivePoints];
    [self addSubview:_FirstIncentiveView];
    [self addSubview:_SecondIncentivePoints];
    [self addSubview:_SecondIncentiveView];
    
    [self addConstraintsToView];

}

#pragma mark- Private Methods

-(void) addConstraintsToView {
    
    if(!_hi5Points ||!_hi5BadgeView ||!_SecondIncentiveView ||!_SecondIncentivePoints ||!_FirstIncentiveView ||!_FirstIncentivePoints)
        return;
    
    NSDictionary *views = @{
                            @"hi5Points": _hi5Points,
                            @"hi5BadgeView": _hi5BadgeView,
                            @"SecondIncentiveView": _SecondIncentiveView,
                            @"SecondIncentivePoints": _SecondIncentivePoints,
                            @"FirstIncentiveView": _FirstIncentiveView,
                            @"FirstIncentivePoints": _FirstIncentivePoints,
                            };

    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[hi5Points]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[hi5BadgeView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[SecondIncentiveView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[SecondIncentivePoints]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[FirstIncentiveView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[FirstIncentivePoints]-|" options:0 metrics:nil views:views]];
    
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[hi5Points(30)]-2-[hi5BadgeView(70)]-10-[FirstIncentivePoints(30)]-2-[FirstIncentiveView(70)]-10-[SecondIncentivePoints(30)]-2-[SecondIncentiveView(70)]-25-|" options:0 metrics:nil views:views]];
    
}

-(void)setBadgesDataModel:(WorkProfileDataModel *)badgesDataModel {
    
     _hi5Points.text = badgesDataModel.hi5BadgeNumber;
    _FirstIncentivePoints.text = badgesDataModel.firstIncentiveBadgeNumber;
     _SecondIncentivePoints.text = badgesDataModel.secondIncentiveBadgeNumber;
    
}

@end
