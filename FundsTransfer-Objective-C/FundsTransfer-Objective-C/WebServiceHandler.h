//
//  WebServiceHandler.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceHandler : NSObject <NSURLConnectionDelegate>
@property(nonatomic,strong) NSURLConnection*    connection;
@property(nonatomic,strong) NSMutableData*      data;
- (void)didReceiveData:(NSData *)data;
- (void)didRequestFailWithError:(NSError *)error;
- (void)cancelRequest;
- (void)startGetRequest:(NSString*) urlRequest;
- (void)startGetMultiRequestForTimeZone:(NSString*) urlRequest;
- (void)startPostRequest:(NSString*) urlRequest withBodyString:(NSString*) bodyStr;
- (void)startPostRequest:(NSString*) urlRequest withBodyData:(NSMutableData*)bodyData;
-(void)startPostRequestWithJSON:(NSString*) urlRequest withBodyData:(NSData*)bodyData;
@end
