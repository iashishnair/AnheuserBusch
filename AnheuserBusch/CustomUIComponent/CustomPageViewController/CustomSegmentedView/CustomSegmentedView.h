//
//  HotMusicSegmentView.h
//  LTBlank
//
//  Created by Le Thang on 9/8/15.
//  Copyright (c) 2015 Le Thang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ScrollingItemTypeBackgroundView,
    ScrollingItemTypeCollectionView,
    ScrollingItemTypeNone,
} ScrollingItemType;

@class CustomSegmentedView;
@protocol LTSegmentedViewDelegate <NSObject>
@optional
- (void) segmentedView:(CustomSegmentedView*)segmentedView didSelectedIndex:(NSInteger)index;
@end

@interface CustomSegmentedView : UIView

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIImageView *imgSelectedTab;

@property (strong, nonatomic) NSArray *titles;

@property (nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) NSObject<LTSegmentedViewDelegate> *delegate;

+ (CustomSegmentedView*) viewWithListTitle:(NSArray*)listTitle;

- (CGFloat) endOfOriginY;

- (void) reloadWithSelectedIndex:(NSInteger)itemIndex;
- (void) reloadSubViewFrameToCurrentPosition;
- (void) scrollingFromRemoteWithValue:(float)scrollingValue;

@end
