//
//  GetBankListWS.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "WebServiceHandler.h"

typedef void (^GetBankListWSHandler) (NSArray *data, NSError *error);

@interface GetBankListWS : WebServiceHandler

@property (nonatomic, strong) GetBankListWSHandler handler;

+(id)getBankListWS:(GetBankListWSHandler)handler;

@end
