//
//  requestAsync.h
//  UrbanSafe
//
//  Created by Guillermo Guizar Barrientos on 30/09/14.
//  Copyright (c) 2014 Urban360, S.A.P.I. de C.V. All rights reserved.
//
#import "ASIFormDataRequest.h"


@interface requestAsync:NSObject {
}
+ (ASIFormDataRequest*) requestUrlAsync:(NSURL*)url andType:(NSString*)type withValues:(NSDictionary *)values withAuthentication:(NSDictionary *)auth;
+ (ASIHTTPRequest *) requestUrlAuthenticationAsync:(NSURL*)url andType:(NSString*)type withValues:(NSDictionary *)values;

@end