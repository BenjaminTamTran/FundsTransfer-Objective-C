//
//  ViewController.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "ViewController.h"
#import <AddressBookUI/AddressBookUI.h>
#import "GetBankListWS.h"
#import "GetAccountInfoWS.h"

@implementation ViewController {
    CGFloat transferInfoDefaultY;
    NSMutableArray* dataBankListArr;
    NSString* selectedBankName;
    NSString* selectedBankCode;
}

#pragma mark - View's lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _localize];
    [self _visualize];
    [self _initialize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchAccountData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


#pragma mark - View's memory handler
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - View's orientation handler
- (BOOL)shouldAutorotate {
    return false;
}
- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}


#pragma mark - View's transition event handler
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - Class's properties


#pragma mark - Class's public methods


#pragma mark - Class's private methods
- (void)_localize {
    dataBankListArr = [[NSMutableArray alloc] init];
    selectedBankName = @"";
    selectedBankCode = @"";
}

- (void)_initialize {
    
}

- (void)_visualize {
    accountInfoView.layer.cornerRadius = 10;
    accountInfoView.layer.masksToBounds = YES;
    
    transferInfoView.layer.cornerRadius = 10;
    transferInfoView.layer.masksToBounds = YES;
    transferInfoBGView.layer.cornerRadius = 5;
    transferInfoBGView.layer.masksToBounds = YES;
    
    bankInfoView.layer.cornerRadius = 10;
    bankInfoView.layer.masksToBounds = YES;
    bankInfoBGView.layer.cornerRadius = 5;
    bankInfoBGView.layer.masksToBounds = YES;
    
    backgroundPaymentView.layer.cornerRadius = 10;
    backgroundPaymentView.layer.masksToBounds = YES;
    backgroundInnerPaymentView.layer.cornerRadius = 5;
    backgroundInnerPaymentView.layer.masksToBounds = YES;
    
    bankListTableView.layer.cornerRadius = 10;
    bankListTableView.layer.masksToBounds = YES;
    
    widthMainViewPaymentConstraints.constant = kScreenWidth;
    leadingMainViewPaymentRConstraint.constant = kScreenWidth;
    
    widthMainViewBankLConstraints.constant = kScreenWidth;
    leadingMainViewBankLRConstraint.constant = kScreenWidth;
    
    [bankListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kBankCellIdentifier];
    accountNumberTextFiled.text = @"1020028960";
    amountTransferTxtField.text = @"9000";
    transferInfoDefaultY = transferInfoView.frame.origin.y;
}

- (void)fetchAccountData {
    [Utility addIndicator:self];
    [GetAccountInfoWS getGetAccountInfoWS:^(NSString *balanceAmount, NSString *remainingLimit, NSError *error) {
        [Utility removeIndicator:self];
        if (balanceAmount != nil) {
            balanceAmountLabel.text = [Utility amountInRpFormat:balanceAmount];
        }
        if (remainingLimit != nil) {
            leftAmountLabel.text = [Utility amountInRpFormat:remainingLimit];
        }
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    hideKeyboardButton.hidden = YES;
    transferAreaTopConstraint.constant = transferInfoDefaultY;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    hideKeyboardButton.hidden = NO;
    transferAreaTopConstraint.constant = accountInfoView.frame.origin.y;
}


#pragma mark - Actions
- (IBAction)hideKeyBoardAction:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)openAddressBookButton:(id)sender {
    
}

- (IBAction)goBackAction:(id)sender {

}

- (IBAction)payNowAction:(id)sender {

}

- (IBAction)openBankListAciton:(id)sender {
    [Utility addIndicator:self];
    [GetBankListWS getBankListWS:^(NSArray *dataArr, NSError *error) {
        NSLog(@"data.count %lu", (unsigned long)dataArr.count);
        [Utility removeIndicator:self];
        if (dataArr != nil) {
            leadingMainViewBankLRConstraint.constant = 0;
            dataBankListArr = [[NSMutableArray alloc] initWithArray:dataArr];
            [bankListTableView reloadData];
        }
        else {
            [Utility showAlertWithMessage:kSomethingWrongMessage withTitle:kTitleWarning];
        }
    }];
}

- (IBAction)closeBankListAction:(id)sender {
    leadingMainViewBankLRConstraint.constant = kScreenWidth;
}

- (IBAction)selectBankInfoAction:(id)sender {
    bankSelectedTxtField.text = selectedBankName;
    leadingMainViewBankLRConstraint.constant = kScreenWidth;
}

- (IBAction)confirmPaymentAction:(id)sender {

}

#pragma mark - UITableViewDataSource's members
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataBankListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBankCellIdentifier];
    NSDictionary* bankInfo = [dataBankListArr objectAtIndex:indexPath.row];
    if (bankInfo != nil) {
        cell.textLabel.text = [bankInfo objectForKey:@"Name"];
    }
    return cell;
}


#pragma mark - UITableViewDelegate's members

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary* bankInfo = [dataBankListArr objectAtIndex:indexPath.row];
    if (bankInfo != nil) {
        selectedBankName = [bankInfo objectForKey:@"Name"];
        selectedBankCode = [bankInfo objectForKey:@"Code"];
    }
}


@end
