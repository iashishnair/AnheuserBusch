//
//  SalesForceChatterHelper.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 23/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "SalesForceChatterHelper.h"
#import "SFRestRequest.h"
#import "SFRestAPI.h"

#define kFeedBackPath @"/services/data/v37.0/chatter/feeds/news/me/feed-elements"

@interface SalesForceChatterHelper () <SFRestDelegate>

@property (nonatomic, copy) SOQLCompletion completionBlock;

@end

@implementation SalesForceChatterHelper

static SalesForceChatterHelper* shareInstance = nil;

+ (SalesForceChatterHelper *)shareInstance {
    
    if(!shareInstance) {
        
        shareInstance = [[SalesForceChatterHelper alloc]init];
    }
    
    return shareInstance;
}

#pragma mark - Public Method

- (void)fetchChatterkFeedBack:(SOQLCompletion)completion

{
    _completionBlock = completion;
    
    SFRestRequest* request = [[SFRestAPI sharedInstance] requestForResources];
    request.path = kFeedBackPath;//
    //[NSString stringWithFormat:@"%@%@%@%@", request.path, @"/chatter/feeds/record/", _detailItem, @"/feed-items/"];
    [[SFRestAPI sharedInstance] send:request delegate:self];
}


#pragma mark - Private Method

- (void)fetchChatterWith:(NSString *)path

{
    SFRestRequest* request = [[SFRestAPI sharedInstance] requestForResources];
    request.path = path;//
    //[NSString stringWithFormat:@"%@%@%@%@", request.path, @"/chatter/feeds/record/", _detailItem, @"/feed-items/"];
    
    [[SFRestAPI sharedInstance] send:request delegate:self];
    
}


#pragma mark - SFRestAPIDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
    
    id json = nil;
    
    NSError *error = nil;
    
    if ([NSJSONSerialization isValidJSONObject:jsonResponse])
    {
        // Serialize the dictionary
        json = [NSJSONSerialization dataWithJSONObject:jsonResponse options:NSJSONWritingPrettyPrinted error:&error];
        
        
        
        // If no errors, let's view the JSON
        if (json != nil && error == nil)
        {
            
            id jsonResult =  [ NSJSONSerialization JSONObjectWithData:json options:NSJSONWritingPrettyPrinted error:&error];
            
//            
           NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
//            
            NSLog(@"JSON: %@", jsonString);
            if( self.completionBlock) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.completionBlock (jsonResult, nil, kSOQLStatusSucccess);
                });
            }
        }
    }

    
   // NSArray *records = [jsonResponse objectForKey:@"records"];
    
    
    
}


- (void)request:(SFRestRequest*)request didFailLoadWithError:(NSError*)error {
    NSLog(@"request:didFailLoadWithError: %@", error);
    // Add your failed error handling here
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if( self.completionBlock) {
            
            self.completionBlock (nil, error, kSOQLStatusFailed);
        }
    });
   
}

- (void)requestDidCancelLoad:(SFRestRequest *)request {
    NSLog(@"requestDidCancelLoad: %@", request);
    // Add your failed error handling here
    
    dispatch_async(dispatch_get_main_queue(), ^{

    if( self.completionBlock) {
        
        self.completionBlock (nil, nil, kSOQLStatusCanceled);
    }
            });
}

- (void)requestDidTimeout:(SFRestRequest *)request {
    NSLog(@"requestDidTimeout: %@", request);
    // Add your failed error handling here
    dispatch_async(dispatch_get_main_queue(), ^{


    if( self.completionBlock) {
        
        self.completionBlock (nil, nil, kSOQLStatusTimedOut);
    }
    });

}

@end
