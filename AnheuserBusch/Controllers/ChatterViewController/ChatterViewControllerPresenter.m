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
                    
                    NSString *feedID = elementsDict[@"id"];

                    NSString *text = nil;
                    
                    if(elementsDict) {
                    
                        id body = elementsDict[@"body"];
                        
                        if(body && [body isKindOfClass:[NSDictionary class]]) {
                            NSDictionary *bodyDict = (NSDictionary *)body;
                            text = bodyDict[@"text"];
                            
                            if(![text isKindOfClass:[NSNull class]] && text.length) {
                              
                                FeedDataModel *feedDataModel = [FeedDataModel new];
                                feedDataModel.feedID = feedID;
                                feedDataModel.feedMessage = text.length ? text : @"";
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




@end
/*https://developer.salesforce.com/trailhead/mobile_sdk_native_ios/mobilesdk_ios_getting_started\
 
 SOQL LIMITION:
 
 https://developer.salesforce.com/docs/atlas.en-us.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_soslsoql.htm
 
 
 SOQL
 https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_select.htm
 
 Salesforce Signin:
 
 https://developer.salesforce.com/docs/atlas.en-us.mobile_sdk.meta/mobile_sdk/sso_authentication_providers.htm
 
 Define the Salesforce Authentication Provider in Your Org
 
 https://developer.salesforce.com/docs/atlas.en-us.noversion.mobile_sdk.meta/mobile_sdk/sso_provider_sfdc.htm#sso_provider_sfdc
 
 http://stackoverflow.com/questions/22268071/salesforce-chatter-integration-with-iphone
 
 https://tools.ietf.org/html/draft-ietf-oauth-v2-10
 
 https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/quickreference_get_news_feed.htm
 
 https://github.com/prosenjitgoswami-cts/Chatter-API-iOS-Sample
 
 
 iOS-oAuth-2.0-Example:
 https://github.com/jonmountjoy/Force.com-iOS-oAuth-2.0-Example
 
 
 
 SFChatter:
 Consumer Key: 3MVG9ZL0ppGP5UrC1kvAlfnakx.imtMJJEo82KqdKJ6CVVDk8sp3J1g6CnHb82W3Fgw0Xx_dZY_sHp0TBriE9
 Consumer Secret: 7133951165858382077
 Callback URL: sfdc://success
 
 
 CHATTER:
 https://developer.salesforce.com/page/Chatter_API?language=en
 https://developer.salesforce.com/page/Getting_Started_with_the_Chatter_REST_API
 
 // Restkit Error 0.10.0 to 0.20.0
 http://stackoverflow.com/questions/14896162/cannot-find-protocol-declaration-for-rkobjectloaderdelegate-xcode-4-6
 
 //
 https://developer.salesforce.com/blogs/developer-relations/2012/03/chatter-api-and-mobile-sdk.html
 
 
 // Feed
 https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/quickreference_get_news_feed.htm
 
 https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/quickreference_search_feed.htm
*/