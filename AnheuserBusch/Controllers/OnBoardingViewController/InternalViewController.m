//
//  InternalViewController.m
//  ABIPOC
//
//  Created by Prsenjit Goswami on 6/10/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import "InternalViewController.h"
#import "Constants.h"

@interface InternalViewController ()

@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UIImageView *screenImage;
@property (weak, nonatomic) IBOutlet UILabel *screenDetails;

@end

@implementation InternalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.screenDetails.text = self.titleText ;
    self.screenDetails.lineBreakMode = NSLineBreakByWordWrapping;
    self.screenDetails.numberOfLines = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureUI {
    
    self.view.backgroundColor = [UIColor brownColor];
    self.screenName.text = self.headingText;
}

#pragma mark - Public method

- (void)setTitleText:(NSString *)titleText {
    
    _titleText = titleText;
    
    if(![NSString isNULLString:_titleText]) {
        
        self.screenDetails.text = _titleText ;
    }
}

- (void)setHeadingText:(NSString *)headingText {
    
    _headingText = headingText;
    
    
    if(![NSString isNULLString:_headingText]) {
        self.screenDetails.text = _headingText ;
    }
}

- (void)setImageFile:(NSString *)imageFile {
    
    _imageFile = imageFile;
    
    if(![NSString isNULLString:_imageFile]) {
        _screenImage.image = [UIImage imageNamed:_imageFile];
    }
}

@end
