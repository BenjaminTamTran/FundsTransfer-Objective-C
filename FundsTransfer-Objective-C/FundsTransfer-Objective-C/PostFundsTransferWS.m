//
//  PostFundsTransferWS.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/13/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "PostFundsTransferWS.h"

@implementation PostFundsTransferWS

+ (id)postFundsTransferWS:(PostFundsTransferWSHandler)handler withDestAcctNo:(NSString*)destAcctNo andAmount:(NSString*)amt {
    PostFundsTransferWS* webService = [[PostFundsTransferWS alloc] init];
    webService.handler = handler;
    NSString *urlAction = [[NSString alloc] initWithFormat:@"%@/%@", kBaseURL, kInitTransferAction];
    NSString *jsonRequest = [NSString stringWithFormat:@"{\"TransferAddRq\": {\"TransferInfo\": {\"DestAcctNo\": \"\%@\", \"DestBankCode\": \"950\", \"Amt\": \"\%@\", \"TranType\": \"I001\"} } }", destAcctNo, amt];
    NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
    
    [webService startPostRequestWithJSON:urlAction withBodyData:requestData];
    
    return webService;
}

- (void)didReceiveData:(NSData *)data {
    NSDictionary* jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions
                                                              error:nil];
    if (jsonDic) {
        if (self.handler) {
            NSDictionary *transferInfo = [jsonDic objectNotNullForKey:@"TransferInfo"];
            NSString* destAcctName = [transferInfo objectNotNullForKey:@"DestAcctName"];
            self.handler(destAcctName, nil);
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
