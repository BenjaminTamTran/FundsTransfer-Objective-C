//
//  Utility.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "Utility.h"
#import "ViewController.h"

@implementation Utility

// Add indicator to the main view controller at the Center Point
+ (void)addIndicator:(UIViewController*) viewC {
    UIView* indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    [viewC.view addSubview:indicatorView];
    indicatorView.tag = 1001;
    indicatorView.backgroundColor = [UIColor clearColor];
    indicatorView.center = [viewC.view center];
    
    //gray background
    UIView* backGround = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    backGround.backgroundColor = [UIColor blackColor];
    backGround.alpha = 0.6;
    backGround.layer.cornerRadius = 10.0;
    backGround.layer.masksToBounds = YES;
    [indicatorView addSubview:backGround];
    
    //indicator
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.alpha = 1.0;
    activityIndicator.frame = CGRectMake(50, 50, 50, 50);
    activityIndicator.backgroundColor = [UIColor clearColor];
    activityIndicator.hidesWhenStopped = NO;
    [indicatorView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    //label
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(40, 110, 100, 20)];
    label.text = @"Loading...";
    label.textColor = [UIColor whiteColor];
    [indicatorView addSubview:label];
}

// Remove the indicator of the main view controller
+ (void)removeIndicator:(UIViewController*) viewC {
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* vElement in viewC.view.subviews) {
            if (vElement.tag == 1001) {
                [vElement removeFromSuperview];
            }
            else {
                vElement.userInteractionEnabled = YES;
            }
        }
    });
}

// Show Alert view with Message and Title with OK Button
+ (void) showAlertWithMessage:(NSString*)message withTitle:(NSString*)title {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:kTitleOKBtn otherButtonTitles:nil, nil];
        [alert show];
    });
}

// Return the Currentcy format in "Rp 5,000.00"
+ (NSString*)amountInRpFormat:(NSString*) amountInString {
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    NSNumber* number = [formatter numberFromString:amountInString];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSString* result = [formatter stringFromNumber:number];
    result = [[NSString alloc] initWithFormat:@"Rp %@", result];
    result = [result stringByReplacingOccurrencesOfString:@"$" withString:@""];
    return result;
}

@end
