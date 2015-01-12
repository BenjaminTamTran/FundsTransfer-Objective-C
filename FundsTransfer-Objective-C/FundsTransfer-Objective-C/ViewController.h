//
//  ViewController.h
//  FundsTransfer-Objective-C
//
//  Created by Tran Huu Tam on 1/12/15.
//  Copyright (c) 2015 BenjaminSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    @private
        IBOutlet UIView* accountInfoView;
        IBOutlet UILabel* balanceAmountLabel;
        IBOutlet UILabel* leftAmountLabel;
        IBOutlet UIView* transferInfoView;
        IBOutlet UIView* transferInfoBGView;
        IBOutlet UIView* bankInfoView;
        IBOutlet UIView* bankInfoBGView;
        IBOutlet UIButton* hideKeyboardButton;
        IBOutlet NSLayoutConstraint* transferAreaTopConstraint;
        IBOutlet UITextField* contactEmailTextField;
        IBOutlet NSLayoutConstraint* leadingMainViewPaymentRConstraint;
        IBOutlet NSLayoutConstraint* widthMainViewPaymentConstraints;
        IBOutlet UIView* backgroundInnerPaymentView;
        IBOutlet UIView* backgroundPaymentView;
        IBOutlet NSLayoutConstraint* leadingMainViewBankLRConstraint;
        IBOutlet NSLayoutConstraint* widthMainViewBankLConstraints;
        IBOutlet UITextField* bankSelectedTxtField;
        IBOutlet UITableView* bankListTableView;
        IBOutlet UITextField* accountNumberTextFiled;
        IBOutlet UILabel* amountTransferLabel;
        IBOutlet UILabel* accountNameLabel;
        IBOutlet UITextField* amountTransferTxtField;

}

@end

