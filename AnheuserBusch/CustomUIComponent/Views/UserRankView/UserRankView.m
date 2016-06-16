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

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIView *userBGImageView;
@property (weak, nonatomic) IBOutlet UILabel *userRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userSalesTargetLabel;

@property (weak, nonatomic) UIImageView * salesPersonImage;
@property (weak, nonatomic)  UILabel *rankLabel;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UILabel *amountLabel;
@end


@implementation UserRankView

- (instancetype)init {
	
	if(self == [super init]) {
		
		//self = [UserRankView loadViewFromNIB];
        
        self.backgroundColor = [UIColor redColor];
	}
	
	return self;
}

#pragma mark - Public Method

-(void)configureUI {
    
    _salesPersonImage = [[UIImageView alloc]init];
    _salesPersonImage.backgroundColor = [UIColor blueColor];
    
  _rankLabel = [[UILabel alloc]init];
    _rankLabel.text = @"#2";
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"JOhn Peters";
    
   _amountLabel = [[UILabel alloc]init];
    _amountLabel.text = @"$123,450.00";
    
    [self addSubview:_salesPersonImage];
    [self addSubview:_rankLabel];
    [self addSubview:_nameLabel];
    [self addSubview:_amountLabel];
    
    
    
    
}


- (void)setUserImageViewBGColor:(UIColor *)userImageViewBGColor {
	
	_userImageViewBGColor = userImageViewBGColor;
	
	self.userBGImageView.backgroundColor = _userImageViewBGColor;
    self.userBGImageView.backgroundColor = [UIColor whiteColor];
    self.userBGImageView.layer.cornerRadius = 10.0f;
}

- (void)setUserImageViewBorderColor:(UIColor *)userImageViewBorderColor {
	
	_userImageViewBorderColor = userImageViewBorderColor;
	
	if(_userImageViewBorderColor) {
		
		self.userImageView.layer.borderColor = _userImageViewBGColor.CGColor;
		self.userImageView.layer.borderWidth = 2.0;
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
		
		self.userRankLabel.text = _userRank;
	}
	
}

- (void)setUserName:(NSString *)userName {
	
	_userName = userName;
	
	if(![NSString isNULLString:_userName]) {
		
		self.userNameLabel.text = _userName;
	}
	
}

- (void)setUserSelesTagetAmount:(NSString *)userSelesTagetAmount {
	
	_userSelesTagetAmount = userSelesTagetAmount;
	
	if(![NSString isNULLString:_userSelesTagetAmount]) {
		
		self.userSalesTargetLabel.text = _userSelesTagetAmount;
	}
	
}

@end
