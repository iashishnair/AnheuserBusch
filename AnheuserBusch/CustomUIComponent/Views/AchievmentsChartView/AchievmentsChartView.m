//
//  AchievmentsChartView.m
//  AnheuserBusch
//
//  Created by MM-iMac on 22/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AchievmentsChartView.h"
#import "Constants.h"
#import "WorkProfileDataModel.h"

@interface AchievmentsChartView ()

@property (nonatomic, strong) UILabel *subGroupLabel;
@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UILabel *pointsLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *percentageLabel;
@property (nonatomic, strong) UIView *innerView;

@end

@implementation AchievmentsChartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    
    if(self == [super init]) {
        
        //self = [UserRankView loadViewFromNIB];
        
        self.backgroundColor = [UIColor yellowColor];
        [self configureUI];
    }
    
    return self;
}

#pragma mark- Private methods

-(void)configureUI {
    
    _innerView = [[UIView alloc]init];
    _innerView.translatesAutoresizingMaskIntoConstraints = NO;
    _innerView.backgroundColor = [UIColor redColor];
    
    _subGroupLabel = [[UILabel alloc]init];
   
    _subGroupLabel.numberOfLines = 1;
    _subGroupLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _subGroupLabel.textColor = [UIColor blackColor];
    
    _rankLabel = [[UILabel alloc]init];
      _rankLabel.numberOfLines = 1;
    _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankLabel.textColor = [UIColor blackColor];
    
    _pointsLabel = [[UILabel alloc]init];

    _pointsLabel.numberOfLines = 1;
    _pointsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _amountLabel = [[UILabel alloc]init];
    
    _amountLabel.numberOfLines = 1;
    _amountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _percentageLabel = [[UILabel alloc]init];
    
    _percentageLabel.numberOfLines = 1;
    _percentageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_innerView addSubview:_rankLabel];
    [_innerView addSubview:_pointsLabel];
    [_innerView addSubview:_amountLabel];
    
    [self addConstraintToInnerView];
    
    [self addSubview:_subGroupLabel];
    [self addSubview:_innerView];
    [self addSubview:_percentageLabel];

    [self addConstraintToView];
    
}

-(void) addConstraintToInnerView {
    
    if(!_amountLabel ||!_pointsLabel ||!_rankLabel)
        return;
    NSDictionary *views = @{
                            @"amountLabel": _amountLabel,
                            @"pointsLabel": _pointsLabel,
                            @"rankLabel": _rankLabel
                        };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[rankLabel]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[pointsLabel]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[amountLabel]-|" options:0 metrics:nil views:views]];
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[rankLabel]-10-[pointsLabel]-10-[amountLabel]-10-|" options:0 metrics:nil views:views]];
    
}

-(void) addConstraintToView {
    
    if(!_subGroupLabel ||!_amountLabel ||!_pointsLabel ||!_rankLabel || !_percentageLabel)
        return;
    NSDictionary *views = @{@"subGroupLabel": _subGroupLabel,
                            @"percentageLabel": _percentageLabel,
                            @"innerView": _innerView };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[subGroupLabel]-|" options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-35-[innerView]-35-|" options:0 metrics:nil views:views]];
    
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[percentageLabel]" options:0 metrics:nil views:views]];
    

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[subGroupLabel]-10-[innerView]" options:0 metrics:nil views:views]];
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[percentageLabel(20)]-10-|" options:0 metrics:nil views:views]];
 
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_innerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_innerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

#pragma mark - setter methods

-(void)setAchievmentsChartDataModel:(WorkProfileDataModel *)achievmentsChartDataModel
{
    _subGroupLabel.text = achievmentsChartDataModel.IncentiveSubgroupHeading;
    _rankLabel.text = achievmentsChartDataModel.IncentiveSubgroupRank;
    _pointsLabel.text = achievmentsChartDataModel.IncentiveSubgroupPoints;
    _amountLabel.text = achievmentsChartDataModel.IncentiveSubgroupAmount;
    _percentageLabel.text = achievmentsChartDataModel.IncentiveSubgroupPercentage;
    
}

@end
