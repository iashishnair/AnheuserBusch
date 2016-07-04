//
//  IncentivesProgressBarViewModel.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 01/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IncentivesProgressBarViewModel : NSObject

@property (nonatomic, strong) UIColor* barBackgroundColor;
@property (nonatomic, strong) UIColor* progressColor;
@property (nonatomic, strong) NSNumber *progressAnount;

@end
