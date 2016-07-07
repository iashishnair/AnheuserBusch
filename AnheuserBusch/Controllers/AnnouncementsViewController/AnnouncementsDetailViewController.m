//
//  AnnouncementsDetailViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AnnouncementsDetailViewController.h"
#import "CStorePLTableViewCell.h"

@interface AnnouncementsDetailViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *incentiveLabelView;
@property (nonatomic, strong) UILabel *minsLabelView;
@property (nonatomic, strong) UILabel *daysLabelView;
@property (nonatomic, strong) UIImageView *announcementImageView;
@property (nonatomic, strong) UITextView *announcementTextView;

@end

@implementation AnnouncementsDetailViewController


#pragma mark - ViewController Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createUI];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    _incentiveLabelView = nil;
    _minsLabelView = nil;
    _daysLabelView = nil;
    _announcementTextView = nil;
    _announcementImageView = nil;
}

#pragma mark - Private Method

- (void)createUI {
    
    self.incentiveLabelView = [[UILabel alloc]init];
    self.incentiveLabelView.text = self.incentiveName;
    self.incentiveLabelView.translatesAutoresizingMaskIntoConstraints = NO;
   
    self.minsLabelView = [[UILabel alloc]init];
    self.minsLabelView.text = self.minsToGo;
    self.minsLabelView.translatesAutoresizingMaskIntoConstraints = NO;
   
    self.daysLabelView = [[UILabel alloc]init];
    self.daysLabelView.text = self.daysLeft;
    self.daysLabelView.translatesAutoresizingMaskIntoConstraints = NO;
   
    self.announcementImageView = [[UIImageView alloc]init];
    self.announcementImageView.backgroundColor = [UIColor grayColor];
    self.announcementImageView.translatesAutoresizingMaskIntoConstraints = NO;
   
    self.announcementTextView = [[UITextView alloc]init];
    self.announcementTextView.backgroundColor = [UIColor lightGrayColor];
    self.announcementTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.announcementTextView.text = self.announcementText;
  
    [self.view addSubview:self.incentiveLabelView];
    [self.view addSubview:self.minsLabelView];
    [self.view addSubview:self.daysLabelView];
    [self.view addSubview:self.announcementImageView];
    [self.view addSubview:self.announcementTextView];
    
    [self addConstraints];
}

- (void)addConstraints {
    
    NSDictionary *views = @{@"incentiveLabelView": self.incentiveLabelView,
                            @"minsLabelView": self.minsLabelView,
                            @"daysLabelView": self.daysLabelView,
                            @"announcementImageView": self.announcementImageView,
                            @"announcementTextView": self.announcementTextView
                            };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[incentiveLabelView(120)]-80-[minsLabelView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[daysLabelView]-|" options:0 metrics:nil views:views]];
  
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[incentiveLabelView(20)]-1-[daysLabelView(20)]-5-[announcementImageView(150)]-5-[announcementTextView]|" options:0 metrics:nil views:views]];
   
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[minsLabelView(20)]|" options:0 metrics:nil views:views]];
    
    //Need to ask//
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[announcementImageView]-|" options:0 metrics:nil views:views]];
   
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[announcementTextView]-100-|" options:0 metrics:nil views:views]];
    
}



@end
