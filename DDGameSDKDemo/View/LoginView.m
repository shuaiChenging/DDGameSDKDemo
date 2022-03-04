//
//  LoginView.m
//  DDGameSDKDemo
//
//  Created by MHJZ on 2022/2/20.
//

#import "LoginView.h"
#import "Masonry.h"
@implementation LoginView

- (id)init
{
    self = [super init];
    if (self)
    {
        [self customerUI];
    }
    return self;
}

- (UILabel *)loginLb
{
    if (!_loginLb)
    {
        _loginLb = [UILabel new];
        _loginLb.textAlignment = NSTextAlignmentCenter;
        _loginLb.backgroundColor = [UIColor orangeColor];
        _loginLb.userInteractionEnabled = YES;
        _loginLb.text = @"登录";
    }
    return _loginLb;
}

- (void)customerUI
{
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor grayColor];
    
    UILabel *titleLb = [UILabel new];
    titleLb.text = @"游戏登录场景";
    [self addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(80);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.loginLb];
    [_loginLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.width.equalTo(@(200));
        make.top.equalTo(titleLb.mas_bottom).offset(60);
        make.centerX.equalTo(self);
    }];
}

@end
