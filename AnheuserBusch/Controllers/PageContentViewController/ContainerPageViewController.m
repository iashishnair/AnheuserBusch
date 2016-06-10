//
//  ContainerPageViewController.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ContainerPageViewController.h"

@implementation ContainerPageViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if(self == [super initWithCoder: coder]) {
        
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.enabled = NO;
        }

    }
    
    return self;
}



@end
