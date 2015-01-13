//
//  FundsTransfer_Objective_CTests.m
//  FundsTransfer-Objective-CTests
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface FundsTransfer_Objective_CTests : XCTestCase
    @property (nonatomic, strong) ViewController *viewC;

@end

@implementation FundsTransfer_Objective_CTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewC = [storyboard instantiateViewControllerWithIdentifier:@"viewControllerID"];
    [self.viewC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.viewC = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

#pragma mark - View loading elements

// Test the view load
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.viewC, @"View not initiated properly");
}

// only test some UIs
- (void)testParentViewHasUIAsExpected
{
    XCTAssertTrue([self.viewC.view.subviews containsObject:self.viewC.hideKeyboardButton], @"View does not have hideKeyboardButton");
    XCTAssertTrue([self.viewC.view.subviews containsObject:self.viewC.accountInfoView], @"View does not have accountInfoView");
    XCTAssertTrue([self.viewC.accountInfoView.subviews containsObject:self.viewC.balanceAmountLabel], @"View does not have balanceAmountLabel");
    XCTAssertTrue([self.viewC.bankListView.subviews containsObject:self.viewC.bankListTableView], @"View does not have a table subview");
}

// Test if the TableView load
-(void)testThatTableViewLoads
{
    XCTAssertNotNil(self.viewC.bankListTableView, @"TableView not initiated");
}

@end
