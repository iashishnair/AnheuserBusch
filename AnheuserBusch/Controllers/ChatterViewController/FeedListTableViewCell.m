//
//  FeedListCell.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "FeedListTableViewCell.h"
#import "FeedDataModel.h"

@interface FeedListTableViewCell ()

@property (nonatomic, strong) NSString *feedID;
@property (nonatomic, strong) UILabel *feedMessageLabel;
@property (nonatomic, strong) UIButton *feedLileButton;
@property (nonatomic, assign) NSUInteger numberOfLike;


@end

@implementation FeedListTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
      
        [self createUI];
    }
    
    return self;
}

#pragma mark - Public Method

- (void)setNumberOfLike:(NSUInteger)numberOfLike {
    
    _numberOfLike = numberOfLike;
    
    [_feedLileButton setTitle: (numberOfLike >0) ? @"Like" : [NSString stringWithFormat:@"Like (%ld)",numberOfLike] forState:UIControlStateNormal];
}

- (void)setFeedDataModel:(FeedDataModel *)feedDataModel {
    
    _feedDataModel = feedDataModel;
    
    if(_feedDataModel) {
        
        [self setFeedID:_feedDataModel.feedID];
    }
    
    if(_feedMessageLabel) {
        
        if(_feedDataModel.feedMessage.length)
            [_feedMessageLabel setText:_feedDataModel.feedMessage];
    }
    
}

#pragma mark - Private Method

- (UILabel *)feedMessageLabel {
    
    if(!_feedMessageLabel) {
        
        _feedMessageLabel = [UILabel new];
        _feedMessageLabel.backgroundColor = [UIColor redColor];
        _feedMessageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _feedMessageLabel;
}

- (UIButton *)feedLileButton {
    
    if(!_feedLileButton) {
        

        _feedLileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _feedLileButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self setNumberOfLike:1];
        _feedLileButton.backgroundColor = [UIColor lightGrayColor];

    }
    
    return _feedLileButton;
}

- (void)createUI {

    [self.contentView addSubview:self.feedMessageLabel];
    [self.contentView addSubview:self.feedLileButton];
    [self addConstrains];
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"feedMessage": self.feedMessageLabel,
                            @"feedLileButton": self.feedLileButton};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedMessage]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedLileButton]" options:0 metrics:nil views:views]];

      [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[feedMessage]-2-[feedLileButton]-|" options:0 metrics:nil views:views]];
    
}
@end