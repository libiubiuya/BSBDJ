//
//  HYLoginController.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/20.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYLoginController.h"

@interface HYLoginController ()<UITextFieldDelegate>

/** 账号 */
@property (weak, nonatomic) IBOutlet UITextField *accountField;
/** 密码 */
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
/** 登录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
/** 记住密码 */
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
/** 自动登录 */
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation HYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加监听
    [self addTextFildObserver];
}

/**
 * 添加监听
 */
- (void)addTextFildObserver
{
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - 点击后事件处理
/**
 * 登录按钮是否可用
 */
- (void)textChange
{
    _loginBtn.enabled = _accountField.text.length && _passwordField.text.length;
}

/**
 * 记住密码业务逻辑
 */
- (IBAction)rmbPwdChange:(UISwitch *)sender
{
    // 取消勾选记住密码的话，自动登录开关的状态调整为关闭
    if (sender.on == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];
    }
}

/**
 * 自动登录业务逻辑
 */
- (IBAction)autoLoginChange:(UISwitch *)sender
{
    // 勾选自动登录的话，记住密码开关的状态调整为打开
    if (sender.on == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];
    }
}

/**
 * dismiss当前界面
 */
- (IBAction)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 设置状态栏颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITextFieldDelegate
/**
 * 监听文本框数值改变
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

@end
