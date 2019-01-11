//
//  HomeTableViewCell_1.h
//  公议
//
//  Created by Mr.Lin on 17/12/19.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>


//声明
@class HomeTableViewCell_1;

//声明代理协议
@protocol BaseCellButtonDelegete <NSObject>

//可选执行方法
@optional
//代理按钮行为
- (void)LeaveWordClick:(HomeTableViewCell_1 *)cell button:(UIButton *)sender;

@end







@interface HomeTableViewCell_1 : UITableViewCell
-(void)setNameLabeText:(NSString *)namestr  DetailLabeText:(NSString *)str  DetailLabe1Text:(NSString *)str1 DateLabeText:(NSString *)datestr  ComeSumLabeText:(NSString *)comsumstr SupportLabeText:(NSString *)supportstr;
-(void)setImageText:(NSString *)str;
-(void)setbtntitle:(NSString *)str;
//委托回调接口
@property (nonatomic, strong) id <BaseCellButtonDelegete> delegate;
@end
