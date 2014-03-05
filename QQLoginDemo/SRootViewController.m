//
//  SRootViewController.m
//  QQLoginDemo
//
//  Created by shi_dongdong on 14-2-23.
//  Copyright (c) 2014年 shi_dongdong. All rights reserved.
//

#import "SRootViewController.h"

@interface SRootViewController ()

@end

@implementation SRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 120, 40);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"QQ Login" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(beginLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 280, 60)];
    _labelTitle.backgroundColor = [UIColor whiteColor];
    _labelTitle.textColor = [UIColor blackColor];
    [self.view addSubview:_labelTitle];
    
	// Do any additional setup after loading the view.
}

- (void)beginLogin
{
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"101025299" andDelegate:self];
    _permissions = [NSArray arrayWithObjects:@"add_share",@"get_user_info", nil];
    [_tencentOAuth authorize:_permissions inSafari:NO];
}

- (void)tencentDidLogin
{
    [btn setTitle:@"登陆完成" forState:UIControlStateNormal];
    
    if (_tencentOAuth.accessToken
        && 0 != [_tencentOAuth.accessToken length])
    {
        //  记录登录用户的OpenID、Token以及过期时间
        _labelTitle.text = _tencentOAuth.accessToken;
    }
    else
    {
        _labelTitle.text = @"登录不成功 没有获取accesstoken";
    }
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{
    
}

- (void)tencentDidNotNetWork
{
    
}

- (void)dealloc
{
    [_labelTitle release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
