//
//  UserProfileView.m
//  AnheuserBusch
//
//  Created by MM-iMac on 22/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "UserProfileView.h"
#import "WorkProfileDataModel.h"

@interface UserProfileView()

@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIView *profileView;
@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UILabel *rankValueLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *nameValueLabel;
@property (nonatomic, strong) UIView *rankView;
@property (nonatomic, strong) UIView *nameView;

@end


@implementation UserProfileView

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
        
        self.backgroundColor = [UIColor blueColor];
        [self configureUI];
    }
    
    return self;
}

#pragma mark- Private methods

-(void)configureUI {
    
    _profileImageView = [[UIImageView alloc]init];
    _profileImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _profileImageView.backgroundColor = [UIColor whiteColor];
    _profileView = [[UIView alloc]init];
    _profileView.translatesAutoresizingMaskIntoConstraints = NO;
    _profileView.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:_profileImageView];
    [self addSubview:_profileView];
    [self addConstraintsToView];
    
    _rankLabel = [[UILabel alloc]init];
    _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankLabel.text = @"Rank";
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.text = @"Name";
    
    _rankValueLabel = [[UILabel alloc]init];
    _rankValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankValueLabel.text = @"#2";
    _rankValueLabel.textAlignment = NSTextAlignmentCenter;

    _nameValueLabel = [[UILabel alloc]init];
    _nameValueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameValueLabel.text = @"John Peterson";
    
    _rankView = [[UIView alloc]init];
    _rankView.translatesAutoresizingMaskIntoConstraints = NO;
    _rankView.backgroundColor = [UIColor redColor];
    
    _nameView = [[UIView alloc]init];
    _nameView.translatesAutoresizingMaskIntoConstraints = NO;
    _nameView.backgroundColor = [UIColor orangeColor];
    
    [_profileView addSubview:_rankView];
    [_profileView addSubview:_nameView];
    
    [_rankView addSubview:_rankLabel];
    [_nameView addSubview:_nameLabel];
    [_rankView addSubview:_rankValueLabel];
    [_nameView addSubview:_nameValueLabel];
    
    
    [self addConstraintsToProfileView];
    [self addConstraintsToRankView];
    [self addConstraintsToNameView];
    
    
}

-(void)addConstraintsToView {
    
    if(!_profileView ||!_profileImageView)
        return;
        
        NSDictionary *views = @{
                                @"profileImageView": _profileImageView,
                                @"profileView": _profileView
                                };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profileImageView(100)]-5-[profileView]-|" options:0 metrics:nil views:views]];
[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[profileView]-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[profileImageView]-|" options:0 metrics:nil views:views]];

    
}

-(void)addConstraintsToRankView {
    if(!_rankLabel || !_rankValueLabel)
        return;
    
    NSDictionary *views = @{
                            @"rankLabel": _rankLabel,
                            @"rankValueLabel": _rankValueLabel
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[rankLabel]-|" options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[rankValueLabel]-|" options:0 metrics:nil views:views]];
    
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[rankLabel(70)]-1-[rankValueLabel]" options:0 metrics:nil views:views]];
    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rankLabel
//                                                     attribute:NSLayoutAttributeWidth
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:_rankValueLabel
//                                                     attribute:NSLayoutAttributeNotAnAttribute 
//                                                    multiplier:1.0 
//                                                      constant:0]];
    

}

-(void)addConstraintsToNameView {
    
    if(!_nameLabel || !_nameValueLabel)
        return;
    
    NSDictionary *views = @{
                            @"nameLabel": _nameLabel,
                            @"nameValueLabel": _nameValueLabel
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[nameLabel]-|" options:0 metrics:nil views:views]];
    
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[nameValueLabel]-|" options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[nameLabel(70)]-1-[nameValueLabel]-|" options:0 metrics:nil views:views]];
    
}

-(void)addConstraintsToProfileView {
    
    if(!_rankView || !_nameView)
        return;
    
    NSDictionary *views = @{
                            @"rankView": _rankView,
                            @"nameView": _nameView
                            };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[rankView]-1-[nameView]" options:0 metrics:nil views:views]];
   
 [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[rankView]-|" options:0 metrics:nil views:views]];
    
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[nameView]-|" options:0 metrics:nil views:views]];
}

@end
