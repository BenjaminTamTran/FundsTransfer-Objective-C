//
//  PostFundsTransferWS.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/13/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "WebServiceHandler.h"

typedef void (^PostFundsTransferWSHandler) (NSString *destAcctName, NSError *error);

@interface PostFundsTransferWS : WebServiceHandler

@property (nonatomic, strong) PostFundsTransferWSHandler handler;

+ (id)postFundsTransferWS:(PostFundsTransferWSHandler)handler withDestAcctNo:(NSString*)destAcctNo andAmount:(NSString*)amt;

@end
