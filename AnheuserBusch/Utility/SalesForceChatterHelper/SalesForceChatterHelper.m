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
#import "FeedDataModel.h"

#define kFeedBackPath @"/services/data/v37.0/chatter/feeds/news/me/feed-elements"
#define kendURL @"/services/data"

#define RestAPIPath_LikeFeed(feedElementId) [NSString stringWithFormat:@"/chatter/feed-elements/%@/capabilities/chatter-likes/items",feedElementId]

#define RestAPIPath_CommentAnFeed(FeedElementId) [NSString stringWithFormat:@"/chatter/feed-elements/%@/capabilities/capabilities/comments/items?text=",FeedElementId]

#define RestAPIPath_PostNewFeed(actorID,messageText) [NSString stringWithFormat:@"/chatter/feed-elements?feedElementType=FeedItem&subjectId=%@&text=%@",actorID,messageText]



@interface SalesForceChatterHelper () <SFRestDelegate>

@property (nonatomic, copy) SOQLCompletion completionBlock;
@property (nonatomic, copy) PostMethodCompletion postMethodCompletion;

@end

@implementation SalesForceChatterHelper

static SalesForceChatterHelper* shareInstance = nil;
+ (SalesForceChatterHelper *)shareInstance {
    
    if(!shareInstance) {
        
        shareInstance = [[SalesForceChatterHelper alloc]init];
    }
    
    return shareInstance;
}

- (instancetype) init {
    
    if(self == [super init]) {
        
      
    }
    
    return self;
}

#pragma mark - Public Method
- (void)fetchUserAllDetails:(void(^)(NSArray * results))completion
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
                            
                            if(![text isKindOfClass:[NSNull class]] && text.length)
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



- (void)fetchChatterkFeedBack:(SOQLCompletion)completion

{
    _completionBlock = completion;
    [self requestWithMethod:SFRestMethodGET path:kFeedBackPath queryParams:nil];
    
}


- (void)fetchFeedLike:(NSString *)commentID completion:(SOQLCompletion)completion

{
    _completionBlock = nil;
    _postMethodCompletion = nil;

    _completionBlock = completion;
    
    NSString *path = [self likePath:commentID];
    
    [self requestWithMethod:SFRestMethodGET path:path queryParams:nil];
    
}

- (void)likeAFeed:(NSString *)feedElementId
              completion:(PostMethodCompletion)completion {
    
    _completionBlock = nil;
    _postMethodCompletion = nil;

    self.postMethodCompletion = completion;
    
    NSString *path = [self restAPIPathForLikefeedElement:feedElementId];
    
    [self requestWithMethod:SFRestMethodPOST path:path queryParams:nil];
    
}

- (void)postAFeed:(NSString *)actorID
                  messageText:(NSString *)messageText
              completion:(PostMethodCompletion)completion {


    _completionBlock = nil;
    _postMethodCompletion = nil;
    
    self.postMethodCompletion = completion;
	
    NSString *path  = [NSString stringWithFormat:@"%@/%@%@",kendURL,[SFRestAPI sharedInstance].apiVersion,RestAPIPath_PostNewFeed(actorID, messageText)];
	
    [self requestWithMethod:SFRestMethodPOST path:path queryParams:nil];
    
}

- (void)postCommentOnAfeed:(NSString *)feedID
					  messageText:(NSString *)messageText
					   completion:(PostMethodCompletion)completion {
		///chatter/feed-items/0D5D0000000JvckKAC/comments?text=
	
	_completionBlock = nil;
	_postMethodCompletion = nil;
	
	self.postMethodCompletion = completion;
		///chatter/feed-elements/feedElementId/capabilities/comments/items

//	NSString *path  = [NSString stringWithFormat:@"%@/%@/chatter/feed-elements/%@/capabilities/comments/items",kendURL,[SFRestAPI sharedInstance].apiVersion,feedID];
	
	NSString *path  = [NSString stringWithFormat:@"/services/data/v37.0/chatter/feed-elements/%@/capabilities/comments/items?text=%@",feedID,messageText];

	
	[self requestWithMethod:SFRestMethodPOST path:path queryParams:nil];
	
}


+ (id)actorElement:(id)element {
	
    
    NSDictionary * actorDict = [NSObject objectForKeySafe:element key:kActor];
    
    return actorDict;
}


+ (id)commentsItemBodyText:(id)element {
    
    NSString * commentsItemsBodyText = nil;
    
    NSDictionary * commentsItemsBody = [NSObject objectForKeySafe:element key:kBody];
    
    if(![NSObject isNullObject:commentsItemsBody]) {
        
        commentsItemsBodyText = [NSObject objectForKeySafe:commentsItemsBody key:kText];
    }
    
    return commentsItemsBodyText;
}


+(id)commentsItems:(id)element {
    
    NSArray * items = nil;
    
    NSDictionary * capabilities = [NSObject objectForKeySafe:element key:@"capabilities"];
    
    if(![NSObject isNullObject:capabilities]) {
        
        NSDictionary * comments = [NSObject objectForKeySafe:capabilities key:kComments];
        
        if(![NSObject isNullObject:comments]) {
            
            
            NSDictionary * pages = [NSObject objectForKeySafe:comments key:kPage];
            
            if(![NSObject isNullObject:pages]) {
                
                items = [NSObject objectForKeySafe:pages key:kItems];
            }
        }
    }
    return items;
}



#pragma mark - Private Method


-(NSString *)restAPIPathForLikefeedElement:(NSString *)feedElementId {
    
    NSString *likePath = [NSString stringWithFormat:@"%@/%@%@",kendURL,[SFRestAPI sharedInstance].apiVersion,RestAPIPath_LikeFeed(feedElementId)];
    return likePath;
}

-(NSString *)restAPIPathForCommentAFeed:(NSString *)feedElementId {
    
    NSString *likePath = [NSString stringWithFormat:@"%@/%@%@",kendURL,[SFRestAPI sharedInstance].apiVersion,RestAPIPath_CommentAnFeed(feedElementId)];
    return likePath;
}


-(NSString *)likePath:(NSString *)commentID {
    
    
    NSString *likePath = [NSString stringWithFormat:@"%@/%@/chatter/comments/%@/likes",kendURL,[SFRestAPI sharedInstance].apiVersion, commentID];
    return likePath;
}


- (void)requestWithMethod:(SFRestMethod)method path:(NSString *)path queryParams:(NSDictionary *)queryParams
{
    SFRestRequest* request = [SFRestRequest requestWithMethod:method path:path queryParams:queryParams];
    
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
            
            NSDictionary *resultsJson=  [ NSJSONSerialization JSONObjectWithData:json options:NSJSONWritingPrettyPrinted error:&error];
            
            NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            
            NSLog(@"JSON: %@", jsonString);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(self.completionBlock) {
                    
                    self.completionBlock (resultsJson, nil, kSOQLStatusSucccess);
                }
                
                if(self.postMethodCompletion) {
                    
                    self.postMethodCompletion (error,kSOQLStatusSucccess);
                }
            });
            
        }
    }
    
}


- (void)request:(SFRestRequest*)request didFailLoadWithError:(NSError*)error {
   
    NSLog(@"request:didFailLoadWithError: %@", error);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(self.completionBlock) {
            
            self.completionBlock (nil, error, kSOQLStatusFailed);
        }
        
        if(self.postMethodCompletion) {
            
            self.postMethodCompletion (error, kSOQLStatusFailed);
        }
        
        
    });
    
}

- (void)requestDidCancelLoad:(SFRestRequest *)request {
   
    NSLog(@"requestDidCancelLoad: %@", request);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if( self.completionBlock) {
            
            self.completionBlock (nil, nil, kSOQLStatusCanceled);
        }
        
        
        if(self.postMethodCompletion) {
            
            self.postMethodCompletion (nil, kSOQLStatusCanceled);
        }
    });
}

- (void)requestDidTimeout:(SFRestRequest *)request {
   
    NSLog(@"requestDidTimeout: %@", request);
  
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        if( self.completionBlock) {
            
            self.completionBlock (nil, nil, kSOQLStatusTimedOut);
        }
        
        if(self.postMethodCompletion) {
            
            self.postMethodCompletion (nil, kSOQLStatusTimedOut);
        }
    });
    
}


@end
