//
//  ChatterViewControllerPresenter.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "ChatterViewControllerPresenter.h"

#import "SFRestRequest.h"
#import "SFRestAPI.h"
#import "SalesForceChatterHelper.h"
#import "FeedDataModel.h"

@implementation ChatterViewControllerPresenter


- (void)fetchChatterkFeedBack:(void(^)(NSArray * results))completion
{
	
    
    [[SalesForceChatterHelper shareInstance]fetchChatterkFeedBack:^(id result, NSError *error, SOQLStatus status) {
        
        if(result) {
            
            NSDictionary *resultDict = (NSDictionary *)result;
            NSArray *elements = resultDict[@"elements"];
            
            __block NSMutableArray *resultFeeds = [NSMutableArray array];
            
            for (id  _Nonnull obj in elements) {
                
                if(obj && [obj isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary *elementsDict = (NSDictionary *)obj;
                    
                    NSString *feedID =  elementsDict[@"id"];

                    NSString *text = nil;
                    
                    if(elementsDict) {
                    
                        id body = elementsDict[@"body"];
                        
                        if(body && [body isKindOfClass:[NSDictionary class]]) {
                            NSDictionary *bodyDict = (NSDictionary *)body;
                            text = bodyDict[@"text"];
                            
                            //if(![text isKindOfClass:[NSNull class]] && text.length)
                            {
                              
                                FeedDataModel *feedDataModel = [FeedDataModel new];
                                feedDataModel.feedID = feedID;
                                feedDataModel.feedMessage = text.length ? text : @"";
                                feedDataModel.element = obj;
                                [resultFeeds addObject:feedDataModel];
                            }
                            
                        }

                   
                    }
                }
                
            }
         
            if(completion) {
                
                completion(resultFeeds);
            }
        }
        
    }];
}


- (void)likeAfeedElement:(NSString *)feedElementId
              completion:(PostMethodCompletion)completion {
    
    [[SalesForceChatterHelper shareInstance] likeAfeedElement:feedElementId completion:completion];
}

- (void)postCommentOnAfeedElement:(nonnull NSString *)feedElementId
                  messageText:(nonnull NSString *)messageText
                   completion:(nullable PostMethodCompletion)completion {
    
    
    [[SalesForceChatterHelper shareInstance] postCommentOnAfeedElement:feedElementId messageText:messageText completion:completion];

}

@end
