//
//  SSTextField.h
//
//  Created by Segev on 10/15/13.
//  Copyright (c) 2013 Segev. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES) 

@interface SSTextField : UITextField
@property (assign, nonatomic) BOOL hideKeyboardWithTapOnScreen;
@property (assign, nonatomic) BOOL hideCaret;
@end
