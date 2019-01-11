//
//  SizeHeader.h
//  WYKKit
//
//  Created by Mr.Lin on 17/10/29.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#ifndef SizeHeader_h
#define SizeHeader_h

#define Notify_CloseSildeMenu  @"closeslidemenu"
#define Notify_OpenSildeMenu          @"openslidemenu"
//常用物理数值
#define ScreenWidth             [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight            [[UIScreen mainScreen] bounds].size.height
#define iOS7AndAbove            ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define TopBarHeight            (iOS7AndAbove ? 64:44)
#define TopAndSystemHeight      (TopBarHeight + SystemHeight)
#define SystemTopY              (iOS7AndAbove ? 20:0)
#define SystemHeight            (iOS7AndAbove ? 0:20)
#define BottomHeight            53
#define LRYScreenpW(ww)  ww*([[UIScreen mainScreen] bounds].size.width)/750
#define LRYScreenpH(hh)  hh*([[UIScreen mainScreen] bounds].size.height)/1334
#define LRYUIColorFromRGB(rgbValue,a) [UIColor colorWithRed:(((rgbValue & 0xFF0000 ) >>16))/255.0 green:(((rgbValue & 0x00FF00) >>8))/255.0 blue:((rgbValue & 0x0000FF))/255.0 alpha:a]
#define LRYsystemFontOfSize(value)((value)/414.0f*[UIScreen mainScreen].bounds.size.width)

//屏幕适配（以iPhone 6为基础）
#define FitWidth(value)         ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)
#define FitHeight(value)        ((value)/1334.0f*[UIScreen mainScreen].bounds.size.height)
#define font(size)              (size)*(ScreenWidth)/750.0f

//颜色定义
#define WYKColor(r, g, b, a)        [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]
#define UIColorRGB(value)       [UIColor colorWithRed:value/255.0 green:value/255.0 blue:value/255.0 alpha:1.0]

#define MainColor               WYKColor(0, 167, 219,1)

#define PINKCOlORSKIN           [UIColor colorWithRed:240.0/255 green:87.0/255 blue:129.0/255 alpha:1.0]
#define REDCOLORSKIN            [UIColor colorWithRed:202.0/255 green:43.0/255 blue:52.0/255 alpha:1.0]
#define WHITECOLOR              [UIColor whiteColor]
#define BLACKCOLOR              [UIColor blackColor]

#define MainBgColor             [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]
#define SelectedColor           [UIColor colorWithRed:98.0/255 green:55.0/255 blue:41.0/255 alpha:1.0]
#define TextBgColor             [UIColor colorWithRed:244.0/255 green:237.0/255 blue:231.0/255 alpha:1.0]

//日志
#define LKDBPath            NSLog(@"数据库地址：%@/Documents/db/LKDB.db",NSHomeDirectory());

//通知名

//网络接口
#define HeadUrl    @"http://gy.fjmaimaimai.com:6000/" //测试使用
//配置选项

#endif /* SizeHeader_h */
