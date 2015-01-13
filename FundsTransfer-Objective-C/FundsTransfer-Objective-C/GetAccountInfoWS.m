//
//  GetAccountInfoWS.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/13/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "GetAccountInfoWS.h"

@implementation GetAccountInfoWS

+(id)getGetAccountInfoWS:(GetAccountInfoWSHandler)handler {
    GetAccountInfoWS* webService = [[GetAccountInfoWS alloc] init];
    webService.handler = handler;
    NSString *urlAction = [[NSString alloc] initWithFormat:@"%@/%@", kBaseURL, kAccountInfoAction];
    [webService startGetRequest:urlAction];
    return webService;
}

- (void)didReceiveData:(NSData *)data {
    NSDictionary* jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions
                                                              error:nil];
    if (jsonDic) {
        if (self.handler) {
            NSDictionary *acctInfo = [jsonDic objectNotNullForKey:@"AcctInfo"];
            NSDictionary *limitInfo = [jsonDic objectNotNullForKey:@"LimitInfo"];
            NSString* balanceAmount = [acctInfo objectNotNullForKey:@"BalanceAmount"];
            NSString* remainingLimit = [limitInfo objectNotNullForKey:@"RemainingLimit"];
            self.handler(balanceAmount, remainingLimit, nil);
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
