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

// Action with Get method
- (void)startGetRequest:(NSString*) urlRequest;

// Action with Post method, param is JSON data
-(void)startPostRequestWithJSON:(NSString*) urlRequest withBodyData:(NSData*)bodyData;

@end
