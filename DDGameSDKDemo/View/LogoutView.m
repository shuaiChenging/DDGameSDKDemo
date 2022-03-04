//
//  LogoutView.m
//  DDGameSDKDemo
//
//  Created by MHJZ on 2022/2/20.
//

#import "LogoutView.h"
#import "Masonry.h"
@implementation LogoutView

- (id)init
{
    self = [super init];
    if (self)
    {
        [self customerUI];
    }
    return self;
}

- (UILabel *)logoutLb
{
    if (!_logoutLb)
    {
        _logoutLb = [UILabel new];
        _logoutLb.textAlignment = NSTextAlignmentCenter;
        _logoutLb.backgroundColor = [UIColor orangeColor];
        _logoutLb.userInteractionEnabled = YES;
        _logoutLb.text = @"登出";
    }
    return _logoutLb;
}

- (UILabel *)realNameLb
{
    if (!_realNameLb)
    {
        _realNameLb = [UILabel new];
        _realNameLb.textAlignment = NSTextAlignmentCenter;
        _realNameLb.backgroundColor = [UIColor orangeColor];
        _realNameLb.userInteractionEnabled = YES;
        _realNameLb.text = @"实名认证";
    }
    return _realNameLb;
}

- (UILabel *)payLb
{
    if (!_payLb)
    {
        _payLb = [UILabel new];
        _payLb.textAlignment = NSTextAlignmentCenter;
        _payLb.backgroundColor = [UIColor orangeColor];
        _payLb.userInteractionEnabled = YES;
        _payLb.text = @"充值一元";
    }
    return _payLb;
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
    
    [self addSubview:self.logoutLb];
    [_logoutLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.width.equalTo(@(200));
        make.top.equalTo(titleLb.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.realNameLb];
    [_realNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.width.equalTo(@(200));
        make.top.equalTo(self.logoutLb.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.payLb];
    [_payLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.width.equalTo(@(200));
        make.top.equalTo(self.realNameLb.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
}

@end
