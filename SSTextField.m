//
//  SSTextField.m
//
//  Created by Segev on 10/15/13.
//  Copyright (c) 2013 Segev. All rights reserved.
//

#import "SSTextField.h"

@implementation SSTextField
{
    UIButton *closeKeyboard;
    UIToolbar *toolBar;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
		[self addToolBar];
    }
    return self;
}

- (void)addToolBar
{
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar = [[UIToolbar alloc]init];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    
    UIBarButtonItem *infoButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone  target:self action:@selector(lowerKeyboard)];
    toolBar.items = [NSArray arrayWithObjects:flexible,infoButtonItem, nil];
    
    closeKeyboard = [UIButton buttonWithType:UIButtonTypeCustom];
    if(IS_IPHONE5)
    {
        closeKeyboard.frame = CGRectMake(0, 0, 320, 290);
        toolBar.frame = CGRectMake(0, 246, 320, 44);
    }
    else
    {
        closeKeyboard.frame = CGRectMake(0, 0, 320, 205);
        toolBar.frame = CGRectMake(0, 161, 320, 44);
    }
    [closeKeyboard addTarget:self action:@selector(lowerKeyboard) forControlEvents:UIControlEventTouchUpInside];
    [closeKeyboard addSubview:toolBar];

    self.inputAccessoryView = closeKeyboard;    
}

- (void)lowerKeyboard
{    
    [self resignFirstResponder];
}

- (void)setHideKeyboardWithTapOnScreen:(BOOL)hideKeyboardWithTapOnScreen
{
    if(!hideKeyboardWithTapOnScreen)
    {
        CGRect tbFrame = toolBar.frame;
        tbFrame.origin.y = 0;
        toolBar.frame = tbFrame;
        
        CGRect btFrame = closeKeyboard.frame;
        btFrame.size.height = 44;
        closeKeyboard.frame = btFrame;
    }
}

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    if(self.hideCaret)
    {
        return CGRectZero;        
    }
    else
    {
        CGRect rect = [super caretRectForPosition:position];
        return  rect;
    }
}

@end
