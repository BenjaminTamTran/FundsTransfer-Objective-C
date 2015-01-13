//
//  GetAccountInfoWS.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/13/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "WebServiceHandler.h"

typedef void (^GetAccountInfoWSHandler) (NSString *balanceAmount, NSString *remainingLimit, NSError *error);
@interface GetAccountInfoWS : WebServiceHandler
@property (nonatomic, strong) GetAccountInfoWSHandler handler;
+(id)getGetAccountInfoWS:(GetAccountInfoWSHandler)handler;
@end
