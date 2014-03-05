//
//  SRootViewController.h
//  QQLoginDemo
//
//  Created by shi_dongdong on 14-2-23.
//  Copyright (c) 2014年 shi_dongdong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
@interface SRootViewController : UIViewController<TencentSessionDelegate,TencentLoginDelegate>
{
    TencentOAuth * _tencentOAuth;
    NSArray * _permissions;
    UIButton * btn;
    UILabel * _labelTitle;
}
@end
