//
//  AnnouncementsDetailViewController.m
//  AnheuserBusch
//
//  Created by MM-iMac on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AnnouncementsDetailViewController.h"
#import "CStorePLTableViewCell.h"

@interface AnnouncementsDetailViewController
 ()

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
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognizer:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognizer:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

- (void)swipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionRight){
        
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    _tableView = nil;
}

#pragma mark - Private Method

- (void)createUI {
    
   // [self.view addSubview:self.tableView];
    self.incentiveLabelView = [[UILabel alloc]init];
   // self.incentiveLabelView.text = @"Incentive Name";
    self.incentiveLabelView.text = self.incentiveName;
    self.incentiveLabelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.minsLabelView = [[UILabel alloc]init];
    self.minsLabelView.text = @"5 mins ago";
    self.minsLabelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.daysLabelView = [[UILabel alloc]init];
    self.daysLabelView.text = @"Starting in 4 days";
    self.daysLabelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.announcementImageView = [[UIImageView alloc]init];
    self.announcementImageView.backgroundColor = [UIColor grayColor];
    self.announcementImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.announcementTextView = [[UITextView alloc]init];
    self.announcementTextView.backgroundColor = [UIColor lightGrayColor];
    self.announcementTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.announcementTextView.text = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
 
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
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[incentiveLabelView(120)]-70-[minsLabelView]-|" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[daysLabelView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[incentiveLabelView(20)]-1-[daysLabelView(20)]-5-[announcementImageView(150)]-5-[announcementTextView]|" options:0 metrics:nil views:views]];
      [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[minsLabelView(20)]|" options:0 metrics:nil views:views]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[announcementImageView]-10-|" options:0 metrics:nil views:views]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[announcementTextView]-10-|" options:0 metrics:nil views:views]];
    
}



@end
