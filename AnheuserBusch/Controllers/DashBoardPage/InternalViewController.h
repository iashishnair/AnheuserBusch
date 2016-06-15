//
//  InternalViewController.h
//  ABIPOC
//
//  Created by Prsenjit Goswami on 6/10/16.
//  Copyright © 2016 Manu's Sena's. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InternalViewController : UIViewController

@property (assign,nonatomic) NSUInteger pageIndex;

@property (strong,nonatomic) NSString *titleText;

@property (strong,nonatomic) NSString *headingText;

@property (strong,nonatomic) NSString *imageFile;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *myHeading;

@end
