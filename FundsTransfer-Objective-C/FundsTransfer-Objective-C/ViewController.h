//
//  ViewController.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate>
    @property (weak, nonatomic) IBOutlet UIView* accountInfoView;
    @property (weak, nonatomic) IBOutlet UILabel* balanceAmountLabel;
    @property (weak, nonatomic) IBOutlet UILabel* leftAmountLabel;
    @property (weak, nonatomic) IBOutlet UIView* transferInfoView;
    @property (weak, nonatomic) IBOutlet UIView* transferInfoBGView;
    @property (weak, nonatomic) IBOutlet UIView* bankInfoView;
    @property (weak, nonatomic) IBOutlet UIView* bankInfoBGView;
    @property (weak, nonatomic) IBOutlet UIButton* hideKeyboardButton;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint* transferAreaTopConstraint;
    @property (weak, nonatomic) IBOutlet UITextField* contactEmailTextField;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint* leadingMainViewPaymentRConstraint;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint* widthMainViewPaymentConstraints;
    @property (weak, nonatomic) IBOutlet UIView* backgroundInnerPaymentView;
    @property (weak, nonatomic) IBOutlet UIView* backgroundPaymentView;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint* leadingMainViewBankLRConstraint;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint* widthMainViewBankLConstraints;
    @property (weak, nonatomic) IBOutlet UITextField* bankSelectedTxtField;
    @property (weak, nonatomic) IBOutlet UITableView* bankListTableView;
    @property (weak, nonatomic) IBOutlet UIView* bankListView;
    @property (weak, nonatomic) IBOutlet UITextField* accountNumberTextFiled;
    @property (weak, nonatomic) IBOutlet UILabel* amountTransferLabel;
    @property (weak, nonatomic) IBOutlet UILabel* accountNameLabel;
    @property (weak, nonatomic) IBOutlet UITextField* amountTransferTxtField;



@end

