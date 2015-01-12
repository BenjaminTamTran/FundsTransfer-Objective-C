//
//  ViewController.m
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)hideKeyBoardAction:(id)sender {
    
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
