
//
//  CustomSlideMenu.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @enum      CustomSlideMenuDirection
 @abstract  An enum that defines the direction of <code>CustomSlideMenu</code>
 
 @constant  CustomSlideMenuDirectionLeftToRight
                Menu appears from left to right of parent view
 */
typedef NS_ENUM(NSInteger, CustomSlideMenuDirection)
{
    CustomSlideMenuDirectionLeftToRight,
    CustomSlideMenuDirectionRightToLeft
};

/*!
 @protocol  CustomSlideMenuDataSource
 @abstract  This protocol represents the data model object
 @note      It's almost the same to UITableViewDataSource
 */

@class CustomSlideMenu, CustomSlideMenuItem;
@protocol CustomSlideMenuDataSource <NSObject>

@required
-(NSInteger)numberOfSectionsInSideMenu:(CustomSlideMenu *)sideMenu;
-(NSInteger)sideMenu:(CustomSlideMenu *)sideMenu numberOfRowsInSection:(NSInteger)section;
-(CustomSlideMenuItem *)sideMenu:(CustomSlideMenu *)sideMenu itemForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

/*!
 @protocol  CustomSlideMenuDelegate
 @abstract  This protocol represents the behaviour of the <code>CustomSlideMenu</code>.
 */

@class CustomSlideMenu, CustomSlideMenuItem;
@protocol CustomSlideMenuDelegate <NSObject>

@optional
/*!
 @abstract  These methods called when <code>CustomSlideMenu</code> changes it's appearance
 @param     sideMenu 
                <code>CustomSlideMenu</code> called which delegate is called
 */
-(void)sideMenuDidShow:(CustomSlideMenu *)sideMenu;
-(void)sideMenuDidHide:(CustomSlideMenu *)sideMenu;

/*!
 @method    sideMenu:didSelectRowAtIndexPath:
 @abstract  Called when user did select some item
 @param     sideMenu
                <code>CustomSlideMenu</code> called which delegate is called
 @param     indexPath
                <code>NSIndexPath</code> of the selected item
 */
-(void)sideMenu:(CustomSlideMenu *)sideMenu didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/*!
 @method    sideMenu:didSelectRowAtIndexPath:
 @abstract  Called when user did select some item
 @param     sideMenu
                <code>CustomSlideMenu</code> called which delegate is called
 @param     section
                Index of section which asking for title
 */
-(NSString *)sideMenu:(CustomSlideMenu *)sideMenu titleForHeaderInSection:(NSInteger)section;

@end

/// -------------------------------------------------------------------
/// @class     CustomSlideMenuItem
/// @abstract  <code>CustomSlideMenuItem</code> represents menu item's data
/// -------------------------------------------------------------------
@interface CustomSlideMenuItem : NSObject

/*!
 @property  icon
 @abstract  Icon image for item
 */
@property (nonatomic, strong) UIImage  *icon;

/*!
 @property  title
 @abstract  Title for item
 */
@property (nonatomic, strong) NSString *title;

/*!
 @property  tag
 @abstract  Tag for item
 @note      Used just for convenience
 */
@property (nonatomic, assign) NSInteger *tag;

@end

/// -------------------------------------------------------------------
/// @class  CustomSlideMenu
/// -------------------------------------------------------------------

@interface CustomSlideMenu : NSObject

/*!
 @method    initWithWidth:andDirection:
 @abstract  Used for initialization of <code>CustomSlideMenu</code> with specified width and direction
 @param     width
                Specified width of the side menu
 @param     direction
                Specified direction of the side menu
 @see       <code>CustomSlideMenuDirection</code>
 @return    <code>CustomSlideMenu</code> instance
 */
-(instancetype)initWithWidth:(CGFloat)width andDirection:(CustomSlideMenuDirection)direction;

/*!
 @property  delegate
 @abstract  <code>CustomSlideMenu</code> delegate object
 @see       CustomSlideMenuDelegate
 */
@property (nonatomic, strong) id <CustomSlideMenuDelegate> delegate;

/*!
 @property  dataSource
 @abstract  <code>CustomSlideMenu</code> data source object
 @see       CustomSlideMenuDataSource
 */
@property (nonatomic, strong) id <CustomSlideMenuDataSource> dataSource;

/*!
 @property  direction
 @abstract  Direction of the <code>CustomSlideMenu</code> 
 @note      Default is CustomSlideMenuDirectionLeftToRight
 @see       CustomSlideMenuDirection enum
 */
@property (nonatomic, assign) CustomSlideMenuDirection direction;

/*!
 @property  width
 @abstract  Specified width of <code>CustomSlideMenu</code>
 @note      Default is 240
 */
@property (nonatomic, assign) CGFloat width;

/*!
 @property  view
 @abstract  View of the <code>CustomSlideMenu</code>
 @note      If iOS version is 8.0 or later it will be initialized as UIVisualEffectView
 */
@property (nonatomic, strong) UIView *view;

/*!
 @property  blurEffectStyle
 @abstract  UIBlurEffectStyle for <code>CustomSlideMenu</code> view
 @note      Use if iOS version is 8.0 or later. Default is UIBlurEffectStyleExtraLight
 */
@property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle NS_AVAILABLE_IOS(8_0);

/*!
 @property  tableView
 @abstract  UITableView object used for data representation
 */
@property (nonatomic, strong) UITableView *tableView;

/*!
 @property  enableOverlay
 @abstract  Determines if dimmed overlay must be showed
 @note      Default value is YES
 */
@property (nonatomic, assign) BOOL enableOverlay;

/*!
 @property  enableOverlay
 @abstract  Determines if <code>CustomSlideMenu</code> should be closed after user tapped outside the menu view
 @note      Default value is YES
 */
@property (nonatomic, assign) BOOL automaticallyDeselectRow;

/*!
 @property  enableOverlay
 @abstract  Determines if <code>CustomSlideMenu</code> should be closed after user selected any item
 @note      Default value is YES
 */
@property (nonatomic, assign) BOOL hideOnSelection;

/*!
 @method    show
 @abstract  Shows <code>CustomSlideMenu</code> view
 */
-(void)show;

/*!
 @method    show
 @abstract  Shows <code>CustomSlideMenu</code> with specified width
 @param     width
                Specified width for <code>CustomSlideMenu</code>
 */
-(void)showWithWidth:(CGFloat)width;

/*!
 @method    show
 @abstract  Hides <code>CustomSlideMenu</code> view
 */
-(void)hide;

/*!
 @property   backgroundColor
 @abstract   Color of selection for <code>tableView</code> rows
 @note       Default is colorWithWhite:1. alpha:.8
 @discussion Use only with iOS 7
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/*!
 @property  selectionColor
 @abstract  Color of selection for <code>tableView</code> rows
 @note      Default is colorWithWhite:1. alpha:.5
 */
@property (nonatomic, strong) UIColor *selectionColor;

/*!
 @property  selectionColor
 @abstract  Color of title for <code>tableView</code> rows
 @note      Default is #252525
 */
@property (nonatomic, strong) UIColor *textColor;

/*!
 @property  sectionTitleFont
 @abstract  Font for item's title of <code>tableView</code> sections
 @note      Default is systemFont with size 15.0
 */
@property (nonatomic, strong) UIFont *sectionTitleFont;

/*!
 @property  sectionTitleColor
 @abstract  Color of section's title for <code>tableView</code> rows
 @note      Default is #8f8f8f
 */
@property (nonatomic, strong) UIColor *sectionTitleColor;

/*!
 @property  iconsColor
 @abstract  Color of section's icons for <code>tableView</code> rows
 @note      Default is #8f8f8f. Set nil if you don't want to override icon color
 */
@property (nonatomic, strong) UIColor *iconsColor;

@end
