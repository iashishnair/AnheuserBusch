	//
	//  UserRankView.m
	//  AnheuserBusch
	//
	//  Created by Prsenjit Goswami on 11/06/16.
	//  Copyright © 2016 Cognizant. All rights reserved.
	//

#import "UserRankView.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>
@interface UserRankView ()

@property (strong, nonatomic) UIImageView * salesPersonImage;
@property (strong, nonatomic) UILabel *rankLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *amountLabel;

@end


@implementation UserRankView

- (instancetype)init {
    
    if(self == [super init]) {
        
        //self = [UserRankView loadViewFromNIB];
        
        //self.backgroundColor = [UIColor redColor];
        
        [self configureUI];
    }
    
    return self;
}

#pragma mark - Public Method

-(void)configureUI {
    
    _salesPersonImage = [[UIImageView alloc]init];
    _salesPersonImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self setUserImageViewBGColor:[UIColor whiteColor]];
    [self setUserImageViewBorderColor:[UIColor whiteColor]];
    _salesPersonImage.backgroundColor = [UIColor blueColor];
    
    _rankLabel = [[UILabel alloc]init];
    _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankLabel.textAlignment = NSTextAlignmentCenter;
    _rankLabel.textColor = [UIColor defaultTextColor];
    _rankLabel.font = [UIFont userRankTextFont];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor defaultTextColor];
    _nameLabel.font = [UIFont userRankTextFont];
    
    _amountLabel = [[UILabel alloc]init];
    _amountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _amountLabel.textAlignment = NSTextAlignmentCenter;
    _amountLabel.textColor = [UIColor defaultTextColor];
    _amountLabel.font = [UIFont userRankTextFont];
    
    [self addSubview:_salesPersonImage];
    [self addSubview:_rankLabel];
    [self addSubview:_nameLabel];
    [self addSubview:_amountLabel];
    
    [self addConstraintsToView];
    
    
}

-(void)addConstraintsToView {
    
    if(!_salesPersonImage || !_rankLabel || !_nameLabel || !_amountLabel) return;
    
    [_salesPersonImage heightMultiplierBy:0.4 toItem:self];
    
    NSDictionary *views = @{@"salesPersonImage": _salesPersonImage,
                            @"rankLabel": _rankLabel,
                            @"nameLabel": _nameLabel,
                            @"amountLabel": _amountLabel };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-7-[salesPersonImage]-7-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[rankLabel]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nameLabel]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[amountLabel]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[salesPersonImage][rankLabel]-2-[nameLabel]-2-[amountLabel]-10-|" options:0 metrics:nil views:views]];
    
    
}


- (void)setUserImageViewBGColor:(UIColor *)userImageViewBGColor {
	
	_userImageViewBGColor = userImageViewBGColor;
	
    self.salesPersonImage.backgroundColor = _userImageViewBGColor;
    self.salesPersonImage.layer.cornerRadius = 15.0f;
    
}

- (void)setUserImageViewBorderColor:(UIColor *)userImageViewBorderColor {
    
    _userImageViewBorderColor = userImageViewBorderColor;
    
    if(_userImageViewBorderColor) {
        
        self.salesPersonImage.layer.borderColor = _userImageViewBGColor.CGColor;
        self.salesPersonImage.layer.borderWidth = 5.0;
    }
    
}

- (void)setUserImageURLString:(NSString *)userImageURLString {
    
    _userImageURLString = userImageURLString;
    
    if([NSString isNULLString:_userImageURLString]) {
        
        
    }
}

- (void)setUserRank:(NSString *)userRank {
    
    _userRank = userRank;
    
    if(![NSString isNULLString:_userRank]) {
        
        self.rankLabel.text = _userRank;
    }
}

- (void)setUserName:(NSString *)userName {
    
    _userName = userName;
    
    if(![NSString isNULLString:_userName]) {
        
        self.nameLabel.text = _userName;
    }
}

- (void)setUserSelesTagetAmount:(NSString *)userSelesTagetAmount {
    
    _userSelesTagetAmount = userSelesTagetAmount;
    
    if(![NSString isNULLString:_userSelesTagetAmount]) {
        
        self.amountLabel.text = _userSelesTagetAmount;
    }
}

@end
