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
    
    // Use Action Bank List, API-1
    NSString *urlAction = [[NSString alloc] initWithFormat:@"%@/%@", kBaseURL, kBankListAction];
    [webService startGetRequest:urlAction];
    return webService;
}

- (void)didReceiveData:(NSData *)data {
    NSDictionary* jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions
                                                              error:nil];
    if (jsonDic) {
        if (self.handler) {
            NSDictionary *entries = [jsonDic objectNotNullForKey:@"Entries"];
            
            // Get the array of dictionary of Bank info
            NSArray *entry = [entries objectNotNullForKey:@"Entry"];
            self.handler(entry, nil);
        }
    } else {
        if (self.handler) {
            self.handler(nil, nil);
        }
    }
}

- (void)didRequestFailWithError:(NSError *)error {
    if (self.handler) {
        self.handler(nil, error);
    }
}

@end
