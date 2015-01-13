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
#import "Utility.h"

@interface FundsTransfer_Objective_CTests : XCTestCase
    @property (nonatomic, strong) ViewController *viewC;

@end

@implementation FundsTransfer_Objective_CTests {
    NSArray *bankArr;
}

#pragma mark - Set up

- (void)setUp {
    [super setUp];
    // Init the view
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewC = [storyboard instantiateViewControllerWithIdentifier:@"viewControllerID"];
    [self.viewC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    NSDictionary *bank1 = @{
                            @"Name": @"Common Bank 1"
                            };
    NSDictionary *bank2 = @{
                            @"Name": @"Common Bank 1"
                            };
    bankArr = [[NSArray alloc] initWithObjects:bank1, bank2, nil];
}

- (void)tearDown {
    self.viewC = nil;
    [super tearDown];
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

#pragma mark - Banking list tests

- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.viewC conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(self.viewC.bankListTableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.viewC conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.viewC.bankListTableView.delegate, @"Table delegate cannot be nil");
}

- (void)testTableViewNumberOfRowsInSection
{
    [self.viewC fakeCallingBankList:bankArr];
    NSInteger expectedRows = 2;
    XCTAssertTrue([self.viewC tableView:self.viewC.bankListTableView numberOfRowsInSection:0] == expectedRows, @"Table has %ld rows but it should have %ld", (long)[self.viewC tableView:self.viewC.bankListTableView numberOfRowsInSection:0], (long)expectedRows);
}

- (void)testTableViewCellCreateCellsWithReuseIdentifier
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.viewC tableView:self.viewC.bankListTableView cellForRowAtIndexPath:indexPath];
    NSString *expectedReuseIdentifier = [NSString stringWithFormat:@"%ld/%ld",(long)indexPath.section,(long)indexPath.row];
    XCTAssertFalse([cell.reuseIdentifier isEqualToString:expectedReuseIdentifier], @"Table create reusable cells");
}


#pragma mark - Utility tests

- (void)testUtilityamountInRpFormat
{
    NSString* amountInString = @"500000";
    NSString* expectedAmountInRp = @"Rp 500,000.00";
    XCTAssertTrue([expectedAmountInRp isEqualToString:[Utility amountInRpFormat:amountInString]], @"The Rp value is not expected");
}


@end
