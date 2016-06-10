//
//  RankingSwitchView.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "RankingSwitchView.h"
#import "Constants.h"

@interface RankingSwitchView ()

@property (weak, nonatomic) IBOutlet UIButton *localRankingButton;
@property (weak, nonatomic) IBOutlet UIButton *marketRakingButton;
@property (weak, nonatomic) IBOutlet UIImageView *separatorView;
@property (weak, nonatomic) IBOutlet UIImageView *localRankingHighlightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *marketRankingHighlightImageView;
@property (assign, nonatomic) RankingState selectedIndex;

@end

@implementation RankingSwitchView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if(self == [super initWithCoder:aDecoder]) {
        
        self.selectedIndex = RankingStateLocal;
    }
    
    return self;
}

#pragma mark -Public Method

- (void)setDatasource:(id<RankingSwitchViewDataSource>)datasource {
    
    _datasource = datasource;
    
    if(_datasource) {
        
        self.selectedIndex = RankingStateLocal;
    }
}


#pragma mark - Private Method

// Setter Method

- (void)setSelectedIndex:(RankingState)selectedIndex {
    
    _selectedIndex = selectedIndex;
    
    [self updateColorOnSelection];
    
    [self updateTextColorOnSelection];
}



/*!
 *  Update Highlight color
 */
- (void)updateColorOnSelection {
    
    
    UIColor *colorInHighlightState =  [UIColor blackColor];
    
    
    if(_datasource && [_datasource respondsToSelector:@selector(colorInHighlightState)]) {
        
        colorInHighlightState =  [_datasource colorInHighlightState];
    }
    
    self.localRankingHighlightImageView.backgroundColor = (self.selectedIndex == RankingStateLocal) ? colorInHighlightState : [UIColor clearColor];
    
    
    self.marketRankingHighlightImageView.backgroundColor = (self.selectedIndex == RankingStateMarket) ? colorInHighlightState : [UIColor clearColor];
}


/*!
 *  Update Text Color color
 */
- (void)updateTextColorOnSelection {
    
    
    UIColor *textColorInHighlightState =  [UIColor blackColor];
    UIColor *textColorInNormalState =  [UIColor blackColor];
    
    if(_datasource && [_datasource respondsToSelector:@selector(textColorInNormalState)]) {
        
        textColorInNormalState =  [_datasource textColorInNormalState];
    }
    
    
    
    if(_datasource && [_datasource respondsToSelector:@selector(textColorInHighlightState)]) {
        
        textColorInHighlightState =  [_datasource textColorInHighlightState];
    }
    
    
    
    [self.localRankingButton setTitleColor:(self.selectedIndex == RankingStateLocal) ? textColorInHighlightState: textColorInNormalState forState:UIControlStateNormal];
    [self.localRankingButton setTitleColor:(self.selectedIndex == RankingStateLocal) ? textColorInHighlightState: textColorInNormalState forState:UIControlStateSelected];
    
    
    [self.marketRakingButton setTitleColor:(self.selectedIndex == RankingStateMarket) ? textColorInHighlightState: textColorInNormalState forState:UIControlStateNormal];
    [self.marketRakingButton setTitleColor:(self.selectedIndex == RankingStateMarket) ? textColorInHighlightState: textColorInNormalState forState:UIControlStateSelected];
}


#pragma mark - IB Action

- (IBAction)clickedLocalRakingVIew:(id)sender {
	
	
    if(self.selectedIndex == RankingStateLocal) return;
    
    self.selectedIndex = RankingStateLocal;
    
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedLocalRakingButton:)]) {
        
        [self.delegate clickedLocalRakingButton:sender];
    }
}


- (IBAction)clickedMarketRankingButton:(id)sender {
    
    if(self.selectedIndex == RankingStateMarket) return;
    
    self.selectedIndex = RankingStateMarket;
 
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickedMarketRankingButton:)]) {
        
        [self.delegate clickedMarketRankingButton:sender];
    }
}

@end
