//
//  PageHeaderViewDelegate.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PageHeaderViewDelegate <NSObject>


- (void)clickedMenuButton:(id)sender ;
- (void)clickedNotificationButton:(id)sender;

@end