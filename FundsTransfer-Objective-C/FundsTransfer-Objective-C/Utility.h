//
//  Utility.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utility : NSObject
+ (void)addIndicator:(UIViewController*) viewC;
+ (void)removeIndicator:(UIViewController*) viewC;
+ (void)showAlertWithMessage:(NSString*)string withTitle:(NSString*)title;
+ (NSString*)amountInRpFormat:(NSString*) amountInString;
@end
