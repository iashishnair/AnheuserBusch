//
//  FeedListCell.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "FeedListTableViewCell.h"
#import "FeedDataModel.h"
#import "UIResponder+UIComponentUtility.h"
#import "commentItemModel.h"

@interface FeedListTableViewCell ()

@property (nonatomic, strong) NSString *feedID;
@property (nonatomic, strong) UILabel *feedMessageLabel;
@property (nonatomic, strong) UIButton *feedLikeButton;

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
    
    [_feedLikeButton setTitle: (numberOfLike >0) ? @"Like" : [NSString stringWithFormat:@"Like (%ld)",numberOfLike] forState:UIControlStateNormal];
}

- (void)setFeedDataModel:(FeedDataModel *)feedDataModel {
    
    _feedDataModel = feedDataModel;
    
    [self updateFeed];
}

- (void)updateFeed {
    
    if(_feedDataModel) {
        
        [self setFeedID:_feedDataModel.feedID];
    }
    
    if(_feedMessageLabel) {
        
        if(_feedDataModel.feedMessage.length)
            [_feedMessageLabel setText:_feedDataModel.feedMessage];
    }
    self.feedMessageLabel.hidden  = YES;
    self.feedMessageLabel.text = nil;
    self.feedLikeButton.hidden = NO;
    
}

- (void)setCommentItemModel:(CommentItemModel *)commentItemModel {
    
    _commentItemModel = commentItemModel;
    
    
    if(_feedMessageLabel && _commentItemModel) {
        
        if(_commentItemModel.message.length)
            [_feedMessageLabel setText:_commentItemModel.message];
    }
    self.feedMessageLabel.hidden  = NO;
    self.feedLikeButton.hidden = YES;
    
}
- (void)updateFeedComments {
  
    
    

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

- (UIButton *)feedLikeButton {
    
    if(!_feedLikeButton) {
        

		_feedLikeButton = [UIButton customButtonWithImage:nil
													  tag:1
												addTarget:self
												   action:@selector(clickedLikeButton:)
										 forControlEvents:UIControlEventTouchUpInside];
        [self setNumberOfLike:1];
        _feedLikeButton.backgroundColor = [UIColor lightGrayColor];

    }
    
    return _feedLikeButton;
}

- (void)createUI {

    [self.contentView addSubview:self.feedMessageLabel];
    [self.contentView addSubview:self.feedLikeButton];
    [self addConstrains];
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"feedMessage": self.feedMessageLabel,
                            @"feedLileButton": self.feedLikeButton};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedMessage]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedLileButton]" options:0 metrics:nil views:views]];

      [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[feedMessage]-2-[feedLileButton]-|" options:0 metrics:nil views:views]];
    
}

#pragma mark - IBAction


- (void)clickedLikeButton:(UIButton *)sender {
	
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedLikeButton:feedDataModel:)]) {
        
        [self.delegate clickedLikeButton:sender feedDataModel:self.feedDataModel];
    }
	
}
@end
