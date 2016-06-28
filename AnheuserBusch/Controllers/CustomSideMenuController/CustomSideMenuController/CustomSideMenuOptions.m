//
//  MVYSideMenuOptions.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//


#import "CustomSideMenuOptions.h"

@implementation CustomSideMenuOptions

- (id)init {
    if (self = [super init]) {

		_bezelWidth = 20.0f;
		_contentViewScale = 0.96f;
		_contentViewOpacity = 0.4f;
		_shadowOpacity = 0.5;
		_shadowRadius = 3;
		_shadowOffset = CGSizeMake(8,0);
		_panFromBezel = YES;
		_panFromNavBar = YES;
        _animationDuration = 0.4f;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
	
    CustomSideMenuOptions *options = [[CustomSideMenuOptions alloc] init];
	options.bezelWidth = self.bezelWidth;
	options.contentViewOpacity = self.contentViewOpacity;
	options.contentViewScale = self.contentViewScale;
    options.panFromBezel = self.panFromBezel;
	options.panFromNavBar = self.panFromNavBar;
    options.animationDuration = self.animationDuration;
	options.shadowOffset = self.shadowOffset;
    options.shadowOpacity = self.shadowOpacity;
    options.shadowRadius = self.shadowRadius;
    return options;
}


@end
