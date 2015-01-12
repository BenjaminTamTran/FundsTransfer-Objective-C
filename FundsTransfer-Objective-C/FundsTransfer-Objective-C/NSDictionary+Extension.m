//
//  NSDictionary+Extension.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)
-(id)objectNotNullForKey:(id)key{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else{
        return object;
    }
}
@end
