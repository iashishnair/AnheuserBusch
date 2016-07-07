//
//  AnnouncementsViewPresenter.m
//  AnheuserBusch
//
//  Created by MM-iMac on 04/07/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "AnnouncementsViewPresenter.h"
#import "AnnouncementDataModel.h"

@implementation AnnouncementsViewPresenter

#pragma mark - AnnouncementsViewProtocol

- (NSMutableArray *)announcementDataSourcePopulate {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    for(int i = 0;i<10;i++)
    {
        AnnouncementDataModel *dataModel = [AnnouncementDataModel new];
        dataModel.incentiveName = [NSString stringWithFormat:@"Incentive %d",i+1];
        dataModel.minsText = [NSString stringWithFormat:@"%d mins to go",i+2];
        dataModel.daysText = [NSString stringWithFormat:@"Starting in %d days",i+1];
        dataModel.announcementText =[NSString stringWithFormat:@"I am Lorem Ipsum %d is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",i+1 ];
        
        [resultsArray addObject:dataModel];
    }
    return resultsArray;
}

@end
