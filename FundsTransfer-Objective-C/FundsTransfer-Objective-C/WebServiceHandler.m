//
//  WebServiceHandler.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "WebServiceHandler.h"
#define kBoundary @"---------------------------14737809831466499882746641449"
@implementation WebServiceHandler
@synthesize connection;
@synthesize data;

-(id)init{
    if(self = [super init]){
        self.data = [[NSMutableData alloc] init];
    }
    return self;
}

-(void)cancelRequest{
    [self.connection cancel];
}

#pragma mark - Overriden methods

/*
 Below 2 methods have to be overriden by subclasses
 Handle when finish receive data or connection have a problem
 */

- (void)didReceiveData:(NSData *)data {
    [NSException raise:NSInternalInconsistencyException format:@"Subclass must override %@ method", NSStringFromSelector(_cmd)];
}

- (void)didRequestFailWithError:(NSError *)error{
    [NSException raise:NSInternalInconsistencyException format:@"Subclass must override %@ method", NSStringFromSelector(_cmd)];
}


#pragma mark - Post/Get Method

// GET method
-(void)startGetRequest:(NSString*) urlRequest
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlRequest]];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    [request setTimeoutInterval:60];
    request.HTTPMethod = @"GET";
    
    // Hardcode Bear Authentication Value and Msisdn Value
    [request setValue:kBearAtuthenticationHeaderValue forHTTPHeaderField:@"Authorization"];
    [request setValue:kMsisdnHeaderValue forHTTPHeaderField:@"Msisdn"];
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

// POST Method
-(void)startPostRequestWithJSON:(NSString*) urlRequest withBodyData:(NSData*)bodyData{
    NSURL *url = [NSURL URLWithString:urlRequest];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:60];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // Hardcode Bear Authentication Value and Msisdn Value
    [request setValue:kBearAtuthenticationHeaderValue forHTTPHeaderField:@"Authorization"];
    [request setValue:kMsisdnHeaderValue forHTTPHeaderField:@"Msisdn"];
    [request setHTTPBody:bodyData];
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - Connection delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.data = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([[challenge protectionSpace] authenticationMethod] == NSURLAuthenticationMethodServerTrust) {
        [[challenge sender] useCredential:[NSURLCredential credentialForTrust:[[challenge protectionSpace] serverTrust]] forAuthenticationChallenge:challenge];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)receivedData {
    [data appendData:receivedData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self didReceiveData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Network failed with error: %@", [error description]);
    [self didRequestFailWithError:error];
}
@end

