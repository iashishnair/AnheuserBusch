
//
//  CustomSlideMenu.h
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 10/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "CustomSlideMenu.h"
#import "Constants.h"

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define ROOTVC [[[[UIApplication sharedApplication] delegate] window] rootViewController]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CustomSlideMenuItem

@synthesize icon;
@synthesize title;
@synthesize tag;

@end

@interface CustomSlideMenu() <UITableViewDelegate, UITableViewDataSource>
{
    UITapGestureRecognizer *tapGesture;
}

@property (nonatomic, strong) UIView *overlay;

@end

@implementation CustomSlideMenu

#pragma mark - Initialization

-(instancetype)init
{
    if (self = [super init])
    {
        [self baseInit];
    }
    
    return self;
}

-(instancetype)initWithWidth:(CGFloat)width andDirection:(CustomSlideMenuDirection)direction
{
    if ((self = [super init]))
    {
        [self baseInit];
        
        self.width      = width;
        self.direction  = direction;
    }
    
    return self;
}

-(void)baseInit
{
    self.width                      = 220;
    self.direction                  = CustomSlideMenuDirectionLeftToRight;
    self.enableOverlay              = YES;
    self.automaticallyDeselectRow   = YES;
    self.hideOnSelection            = YES;
    
    self.sectionTitleFont   = [UIFont systemFontOfSize:15.];
    self.selectionColor     = [UIColor colorWithWhite:1. alpha:.5];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    self.backgroundColor    = [UIColor colorWithWhite:1. alpha:.8];
#pragma clang diagnostic pop
    self.textColor          = UIColorFromRGB(0x252525);
    self.iconsColor         = UIColorFromRGB(0x8f8f8f);
    self.sectionTitleColor  = UIColorFromRGB(0x8f8f8f);
    
    if(!SYSTEM_VERSION_LESS_THAN(@"8.0"))
        self.blurEffectStyle = UIBlurEffectStyleExtraLight;
}

-(void)initViews
{
    self.overlay = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.overlay.alpha = 0;
    self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (self.enableOverlay)
        self.overlay.backgroundColor = [UIColor colorWithWhite:0. alpha:.4];
    
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [self.overlay addGestureRecognizer:tapGesture];
    
    CGRect frame = [self frameHidden];
    
   // if(!SYSTEM_VERSION_LESS_THAN(@"8.0"))
    {
        self.view = [[UIView alloc] initWithFrame:frame];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.view.backgroundColor = self.backgroundColor;
#pragma clang diagnostic pop
        

    }
//    else
//    {
//
//        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:self.blurEffectStyle];
//        self.view = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        self.view.frame = frame;
//    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate         = self;
    self.tableView.dataSource       = self;
    self.tableView.separatorColor   = [UIColor clearColor];
    self.tableView.backgroundColor  = [UIColor clearColor];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Appearance

-(void)show
{
    [self initViews];
    
    [ROOTVC.view addSubview:self.overlay];
    [ROOTVC.view addSubview:self.view];
    
    CGRect frame = [self frameShowed];
    
    [UIView animateWithDuration:0.275 animations:^
     {
         self.view.frame = frame;
         self.overlay.alpha = 1.0;
     }
                     completion:^(BOOL finished)
     {
         if (_delegate && [_delegate respondsToSelector:@selector(sideMenuDidShow:)])
             [_delegate sideMenuDidShow:self];
     }];
}

-(void)showWithWidth:(CGFloat)width
{
    self.width = width;
    [self show];
}

-(void)hide
{
    [UIView animateWithDuration:0.275 animations:^
     {
         self.view.frame = [self frameHidden];
         self.overlay.alpha = 0.;
     }
                     completion:^(BOOL finished)
     {
         if (_delegate && [_delegate respondsToSelector:@selector(sideMenuDidHide:)])
             [_delegate sideMenuDidHide:self];
         
         [self.view removeFromSuperview];
         [self.overlay removeFromSuperview];
         [self.overlay removeGestureRecognizer:tapGesture];
         
         self.overlay = nil;
         self.tableView = nil;
         self.view = nil;
     }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataSource numberOfSectionsInSideMenu:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource sideMenu:self numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UIImageView *imageViewIcon;
    UILabel *title;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.backgroundColor = [UIColor clearColor];
        
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:self.selectionColor];
        [cell setSelectedBackgroundView:bgColorView];
    }
    
    CustomSlideMenuItem *item = [self.dataSource sideMenu:self itemForRowAtIndexPath:indexPath];
    
    CGFloat contentHeight = cell.frame.size.height * .8;
    CGFloat contentTopBottomPadding = cell.frame.size.height * .1;
    
    if (item.icon)
    {
        imageViewIcon = [cell.contentView viewWithTag:100];
        
        if (!imageViewIcon)
        {
            imageViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, contentTopBottomPadding, contentHeight, contentHeight)];
            imageViewIcon.tag = 100;
            [cell.contentView addSubview:imageViewIcon];
        }
        
        imageViewIcon.image = item.icon;
        
        if (self.iconsColor)
        {
            imageViewIcon.image = [imageViewIcon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            imageViewIcon.tintColor = self.iconsColor;
        }
    }
    
    title = [cell.contentView viewWithTag:200];
    
    if (!title)
    {
        CGFloat titleX = item.icon ? CGRectGetMaxX(imageViewIcon.frame) + 12 : 12;
        title = [[UILabel alloc] initWithFrame:CGRectMake(titleX, contentTopBottomPadding, cell.frame.size.width - titleX - 12, contentHeight)];
        title.tag = 200;
        title.font = [UIFont systemFontOfSize:17.0];
        title.adjustsFontSizeToFitWidth = YES;
        [cell.contentView addSubview:title];
    }
    
    title.text      = item.title;
    title.textColor = self.textColor;
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegate && [_delegate respondsToSelector:@selector(sideMenu:didSelectRowAtIndexPath:)])
        [_delegate sideMenu:self didSelectRowAtIndexPath:indexPath];
    
    if (self.automaticallyDeselectRow)
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.hideOnSelection)
        [self hide];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sideMenu:titleForHeaderInSection:)])
        return [self.delegate sideMenu:self titleForHeaderInSection:section].uppercaseString;
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor clearColor];
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:self.sectionTitleColor];
    [header.textLabel setFont:self.sectionTitleFont];
}

#pragma mark - UITapGestureRecognition

-(void)didTap:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
        [self hide];
}

#pragma mark - Helpers

-(CGRect)frameHidden
{
    CGFloat x = self.direction == CustomSlideMenuDirectionLeftToRight ? -self.width : [UIScreen mainScreen].bounds.size.width + self.width;
    return CGRectMake(x, 20, self.width, [UIScreen mainScreen].bounds.size.height);
}

-(CGRect)frameShowed
{
    CGFloat x = self.direction == CustomSlideMenuDirectionLeftToRight ? 0 : [UIScreen mainScreen].bounds.size.width - self.width;
    return CGRectMake(x, 20, self.width, self.view.frame.size.height);
}

@end
