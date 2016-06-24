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
#import "Constants.h"

@interface FeedListTableViewCell ()

@property (nonatomic, strong) NSString *feedID;
@property (nonatomic, strong) UILabel *feedMessageLabel;
@property (nonatomic, strong) UIButton *feedLikeButton;
@property (nonatomic, strong) UIButton *commentButton;

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
		_feedMessageLabel.font = [UIFont boldSystemFontOfSize:20.0];
		_feedMessageLabel.textColor = [UIColor redColor];

    }
  

}

- (void)setCommentItemModel:(CommentItemModel *)commentItemModel {
    
    _commentItemModel = commentItemModel;
    
    
    if(_feedMessageLabel && _commentItemModel) {
        
        if(_commentItemModel.message.length)
            [_feedMessageLabel setText:_commentItemModel.message];
    }
    self.feedMessageLabel.hidden  = NO;
	self.commentButton.hidden = YES;
	self.feedLikeButton.hidden = YES;

}
- (void)updateFeedComments {
  
    
    

}

#pragma mark - Private Method


- (UIButton *)commentButton {
	
	if(!_commentButton) {
		
		_commentButton = [UIButton customButtonWithImage:nil
													  tag:1
												addTarget:self
												   action:@selector(clickedCommmentButton:)
										 forControlEvents:UIControlEventTouchUpInside];
		[_commentButton setTitle:@"Commment" forState:UIControlStateNormal];
		_commentButton.backgroundColor = [UIColor lightGrayColor];

		
	}
	
	return _commentButton;
}
- (UILabel *)feedMessageLabel {
    
    if(!_feedMessageLabel) {
        
        _feedMessageLabel = [UILabel new];
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
	[self.contentView addSubview:self.commentButton];

    [self addConstrains];
}

- (void)addConstrains {
    
    NSDictionary *views = @{@"feedMessage": self.feedMessageLabel,
                            @"feedLileButton": self.feedLikeButton,
							@"commentButton": self.commentButton};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedMessage]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[feedLileButton]-[commentButton]" options:0 metrics:nil views:views]];

      [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[feedMessage]-2-[feedLileButton]-|" options:0 metrics:nil views:views]];
	
	[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.commentButton  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.feedLikeButton attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
	
}

#pragma mark - IBAction


- (void)clickedLikeButton:(UIButton *)sender {
	
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedLikeButton:feedDataModel:)]) {
        
        [self.delegate clickedLikeButton:sender feedDataModel:self.feedDataModel];
    }
	
}
- (void)clickedCommmentButton:(UIButton *)sender {
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(clickedCommentButton:feedDataModel:)]) {
		
		[self.delegate clickedCommentButton:sender feedDataModel:self.feedDataModel];
	}
	
}

@end
