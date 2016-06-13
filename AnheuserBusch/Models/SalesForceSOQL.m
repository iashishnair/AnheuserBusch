//
//  SalesForceSOQL.m
//  AnheuserBusch
//
//  Created by Prsenjit Goswami on 13/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

#import "SalesForceSOQL.h"
#import <SalesforceRestAPI/SFRestAPI.h>
#import <SalesforceRestAPI/SFRestRequest.h>
#import <SalesforceRestAPI/SFRestAPI.h>

@interface SalesForceSOQL () <SFRestDelegate>

@property (nonatomic, copy) SOQLCompletion completionBlock;

@end

@implementation SalesForceSOQL

static SalesForceSOQL *salesForceSOQL = nil;

+ (SalesForceSOQL *)shareInstance {
    
    if(!salesForceSOQL) {
        salesForceSOQL = [[SalesForceSOQL alloc]init];
    }
    
    return salesForceSOQL;
    
}

#pragma mark - Public Method

- (void)getDetailsWithSOQL:(nonnull NSString *)soqlString completion:(SOQLCompletion)completion {
    
    
    if(completion) {
      
        if(!soqlString.length) {
            completion (nil, nil, kSOQLStatusInvalidSOQL);
            
        } else {
            self.completionBlock = completion;
        }
    }
    
    SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQuery:soqlString];
    [[SFRestAPI sharedInstance] send:request delegate:self];
}


- (void)getUserDetails:(SOQLCompletion)completion {
    
    [self getDetailsWithSOQL:@"SELECT Name FROM account LIMIT 10" completion:completion];
}


- (void)getSmallPhotoUrlURL:(SOQLCompletion)completion {
    
    [self getDetailsWithSOQL:@"SELECT SmallPhotoUrl FROM User" completion:completion];
}

#pragma mark - SFRestAPIDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
    NSArray *records = [jsonResponse objectForKey:@"records"];
    
    if( self.completionBlock) {
        
        self.completionBlock (records, nil, kSOQLStatusSucccess);
    }
    
    NSLog(@"request:didLoadResponse: #records: %lu", (unsigned long)records.count);
}


- (void)request:(SFRestRequest*)request didFailLoadWithError:(NSError*)error {
    NSLog(@"request:didFailLoadWithError: %@", error);
    // Add your failed error handling here
    
    if( self.completionBlock) {
        
        self.completionBlock (nil, error, kSOQLStatusFailed);
    }
}

- (void)requestDidCancelLoad:(SFRestRequest *)request {
    NSLog(@"requestDidCancelLoad: %@", request);
    // Add your failed error handling here
    
    
    if( self.completionBlock) {
        
        self.completionBlock (nil, nil, kSOQLStatusCanceled);
    }
}

- (void)requestDidTimeout:(SFRestRequest *)request {
    NSLog(@"requestDidTimeout: %@", request);
    // Add your failed error handling here
    
    
    if( self.completionBlock) {
        
        self.completionBlock (nil, nil, kSOQLStatusTimedOut);
    }
}


@end
