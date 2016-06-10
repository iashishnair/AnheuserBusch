//
//  RankingSwitchView.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankingSwitchViewProtocols.h"

@interface RankingSwitchView : UIView

@property (nonatomic, weak) id <RankingSwitchViewDelegate> delegate;
@property (nonatomic, weak) id <RankingSwitchViewDataSource> datasource;

@end
