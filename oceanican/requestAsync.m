//
//  requestAsync.m
//  UrbanSafe
//
//  Created by Guillermo Guizar Barrientos on 30/09/14.
//  Copyright (c) 2014 Urban360, S.A.P.I. de C.V. All rights reserved.
//

#import "requestAsync.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "ASIFormDataRequest.h"


@implementation requestAsync



+ (ASIFormDataRequest*) requestUrlAsync:(NSURL*)url andType:(NSString*)type withValues:(NSDictionary *)values withAuthentication:(NSDictionary *)auth{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:type];
    [request setUseSessionPersistence:NO];
    [request setUseCookiePersistence:NO];
    if([values count] > 0){
        for (NSString* key in values) {
            id value = [values objectForKey:key];
            [request setPostValue:value forKey:key];
        }
        [request buildPostBody];
    }
    if([auth count] > 0){
        [request setUsername:[auth objectForKey:@"username"]];
        [request setPassword:[auth objectForKey:@"password"]];
        [request addBasicAuthenticationHeaderWithUsername:[auth objectForKey:@"username"] andPassword:[auth objectForKey:@"password"]];
    }
    return request;
}



+ (ASIHTTPRequest*) requestUrlAuthenticationAsync:(NSURL*)url andType:(NSString*)type withValues:(NSDictionary *)values{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:type];
    [request setUseSessionPersistence:NO];
    [request setUseCookiePersistence:NO];
    [request setUsername:[values objectForKey:@"username"]];
    [request setPassword:[values objectForKey:@"password"]];
    [request addBasicAuthenticationHeaderWithUsername:[values objectForKey:@"username"] andPassword:[values objectForKey:@"password"]];
        //    NSLog(@"%@", [request responseData]);
    return request;
}


@end
