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

@implementation ViewController {
    CGFloat transferInfoDefaultY;
}

#pragma mark - View's lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _localize];
    [self _visualize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchData];
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

- (void)fetchData {
    [self addIndicator];
    [GetBankListWS getBankListWS:^(NSArray *data, NSError *error) {
        NSLog(@"data.count %lu", (unsigned long)data.count);
        [self removeIndicator];
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

- (void)addIndicator{
    UIView* indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    [self.view addSubview:indicatorView];
    indicatorView.tag = 1001;
    indicatorView.backgroundColor = [UIColor clearColor];
    indicatorView.center = [self.view center];
    
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

- (void)removeIndicator{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* vElement in self.view.subviews) {
            if (vElement.tag == 1001) {
                [vElement removeFromSuperview];
            }
            else {
                vElement.userInteractionEnabled = YES;
            }
        }
    });
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

}
- (IBAction)closeBankListAction:(id)sender {

}
- (IBAction)selectBankInfoAction:(id)sender {

}
- (IBAction)confirmPaymentAction:(id)sender {

}

#pragma mark - UITableViewDataSource's members
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    
    return cell;
}


#pragma mark - UITableViewDelegate's members

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
