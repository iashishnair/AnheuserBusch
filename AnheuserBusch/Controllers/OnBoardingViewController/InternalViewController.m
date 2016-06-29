//
//  InternalViewController.m
//  ABIPOC
//
//  Created by Prsenjit Goswami on 6/10/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import "InternalViewController.h"

@interface InternalViewController ()

@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UIImageView *screenImage;
@property (weak, nonatomic) IBOutlet UILabel *screenDetails;

@end

@implementation InternalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor redColor];
    //self.view.backgroundColor = [UIColor redColor];
    
//    self.myLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    self.myLabel.numberOfLines = 0;
//    self.myLabel.text = self.titleText;
//    self.myImage.image = [UIImage imageNamed:self.imageFile];
//    self.myHeading.text = self.headingText;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
