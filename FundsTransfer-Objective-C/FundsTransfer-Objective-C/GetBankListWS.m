//
//  GetBankListWS.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "GetBankListWS.h"

@implementation GetBankListWS

+(id)getBankListWS:(GetBankListWSHandler)handler{
    GetBankListWS* webService = [[GetBankListWS alloc] init];
    webService.handler = handler;
    [webService startGetRequest:@""];
    return webService;
}

- (void)didReceiveData:(NSData *)data {
    NSDictionary* jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions
                                                              error:nil];
    if (jsonDic) {
        if (self.handler) {
            NSString *code = [jsonDic objectNotNullForKey:@"code"];
            self.handler(code, jsonDic, nil);
        }
    } else {
        if (self.handler) {
            self.handler(nil, nil, nil);
        }
    }
}

- (void)didRequestFailWithError:(NSError *)error {
    if (self.handler) {
        self.handler(nil, nil, error);
    }
}

@end
