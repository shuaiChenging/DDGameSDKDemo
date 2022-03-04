//
//  ViewController.m
//  DDGameSDKDemo
//
//  Created by MHJZ on 2022/3/3.
//

#import "ViewController.h"
#import <DDGameSDK/DDGameManage.h>
#import "LoginView.h"
#import "LogoutView.h"
#import "Masonry.h"
#import "JKCategories.h"
@interface ViewController ()
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) LogoutView *logoutView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RoleInfo *info = [RoleInfo new];
    info.roleId = @"1";
    info.roleLevel = @"11";
    info.roleName = @"我的角色";
    info.serverId = @"abc_123";
    info.serverName = @"服务器名称";
    [DDGameManage setRoleInfo:info];
    
    [self.view addSubview:self.loginView];
    __weak typeof(self) weakSelf = self;
    [_loginView.loginLb jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf loadLoginView];
    }];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.view addSubview:self.logoutView];
    [_logoutView.logoutLb jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf.view bringSubviewToFront:weakSelf.loginView];
        [weakSelf reloadLoginView];
    }];
    [_logoutView.realNameLb jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        
    }];
    [_logoutView.payLb jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakSelf setCenterInfo];
        
    }];
    [_logoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.view bringSubviewToFront:_loginView];
    [self loadLoginView];
}

- (NSString *)getCurrentTimeBySecond
{
    double currentTime =  [[NSDate date] timeIntervalSince1970];
    NSString *strTime = [NSString stringWithFormat:@"%.0f",currentTime];
    return strTime;
}

- (void)setCenterInfo
{
    CenterInfo *centerInfo = [CenterInfo new];
    centerInfo.productName = @"200元宝";
    centerInfo.cpOrderId = [self getCurrentTimeBySecond];
    centerInfo.extend = @"unknow";
    [DDGameManage loadCenterViewWithCommodity:centerInfo.productName number:@"0.01" centerInfo:centerInfo];
}

- (void)reloadLoginView
{
    __weak typeof(self) weakSelf = self;
    [self.view bringSubviewToFront:self.loginView];
    [DDGameManage reloadLoginViewWithLoginSuccess:^{
        [weakSelf loadLogoutView];
    }];
}

- (void)loadLoginView
{
    __weak typeof(self) weakSelf = self;
    [self.view bringSubviewToFront:self.loginView];
    [DDGameManage loadLoginViewWithLoginSuccess:^{
        [weakSelf loadLogoutView];
    }];
}

- (void)loadLogoutView
{
    __weak typeof(self) weakSelf = self;
    [self.view bringSubviewToFront:self.logoutView];
    [DDGameManage showNameIdentificationViewWithChangeAccount:^{
        [weakSelf reloadLoginView];
    }];
}

- (LoginView *)loginView
{
    if (!_loginView)
    {
        _loginView = [LoginView new];
    }
    return _loginView;
}

- (LogoutView *)logoutView
{
    if (!_logoutView)
    {
        _logoutView = [LogoutView new];
    }
    return _logoutView;
}


@end
