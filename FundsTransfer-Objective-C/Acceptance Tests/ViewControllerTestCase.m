//
//  ViewControllerTestCase.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/13/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "ViewControllerTestCase.h"

@implementation ViewControllerTestCase

#pragma mark - Set up

- (void)setUp {
    [super setUp];
    // Init the view
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewC = [storyboard instantiateViewControllerWithIdentifier:@"viewControllerID"];
    [self.viewC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    self.viewC = nil;
    [super tearDown];
}

#pragma mark - Integration test

- (void)testBankListAndCancel {
    // Open Bank list
    [tester tapViewWithAccessibilityLabel:@"Bank List Button"];
    [tester waitForViewWithAccessibilityLabel:@"Bank List Container"];
    
    // Close Bank List
    [tester tapViewWithAccessibilityLabel:@"Close Bank List Button"];
}

- (void)testBankListAndSelect {
    
    // Open Bank list
    [tester tapViewWithAccessibilityLabel:@"Bank List Button"];
    [tester waitForViewWithAccessibilityLabel:@"Bank List Container"];
    // Select the 3rd Bank item
    [tester tapRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] inTableViewWithAccessibilityIdentifier:@"Bank List Tbl Id"];
    // Tap on Select Button
    [tester tapViewWithAccessibilityLabel:@"Select Bank Item"];
    
}

- (void)testPostFundsTransfer {
    // Input Data to submit Transfer
    [tester clearTextFromAndThenEnterText:@"15000" intoViewWithAccessibilityLabel:@"Amount Transfer Label"];
    [tester clearTextFromAndThenEnterText:@"1020028960" intoViewWithAccessibilityLabel:@"Account Number Label"];
    
    [tester tapViewWithAccessibilityLabel:@"Pay Now Button"];
    [tester waitForTimeInterval:15];
    [[tester usingTimeout:1] waitForViewWithAccessibilityLabel:@"Result Payment View"];
    
    [tester waitForViewWithAccessibilityLabel:@"Result Payment View"];
    [tester tapViewWithAccessibilityLabel:@"Confirm Payment Button"];
    [tester tapViewWithAccessibilityLabel:@"Back To Main View Button"];
    
    // Tap and wait to see the Address Book
    [tester tapViewWithAccessibilityLabel:@"Address Book Button"];
}

@end
