//
//  AddFlagView.m
//  公议
//
//  Created by Mr.Lin on 17/12/30.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//UILineBreakModeWordWrap = 0,以单词为单位换行，以单词为单位截断。
//UILineBreakModeCharacterWrap,以字符为单位换行，以字符为单位截断。
//label.lineBreakMode = NSLineBreakByCharWrapping;以字符为显示单位显示，后面部分省略不显示。
//label.lineBreakMode = NSLineBreakByClipping;剪切与文本宽度相同的内容长度，后半部分被删除。
//label.lineBreakMode = NSLineBreakByTruncatingHead;前面部分文字以……方式省略，显示尾部文字内容。
//label.lineBreakMode = NSLineBreakByTruncatingMiddle;中间的内容以……方式省略，显示头尾的文字内容。
//label.lineBreakMode = NSLineBreakByTruncatingTail;结尾部分的内容以……方式省略，显示头的文字内容。
//label.lineBreakMode = NSLineBreakByWordWrapping;以单词为显示单位显示，后面部分省略不显示。

#import "AddFlagView.h"
#import "SizeHeader.h"
#define LEFTSIZE LRYScreenpW(40)
@interface AddFlagView ()


@end

@implementation AddFlagView
-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if(self)
    {
        
        [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [self setBackgroundColor:WYKColor(51, 51, 51, 0.5)];
        [self addPopView];
        
    }
    
    return self;
}


-(void)addPopView
{
    UIView *PopView =[[UIView alloc]initWithFrame:CGRectMake( LEFTSIZE, LRYScreenpW(500), ScreenWidth-LEFTSIZE*2,LRYScreenpH(510))];
    [PopView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *labHead =[[UILabel alloc]initWithFrame:CGRectMake(LEFTSIZE/2, LRYScreenpH(20),CGRectGetWidth(PopView.frame)-LEFTSIZE , LRYScreenpH(110))];
    [labHead setTextColor:[UIColor blackColor]];
    [labHead setText:@"如果您确定现在的标签不足以说明您所服务的单位，请在下面填写新标签，如果您的标签审核通过将可进行使用"];
    [labHead setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
    [labHead setBackgroundColor:[UIColor clearColor]];
    labHead.numberOfLines=3;
    labHead.lineBreakMode =NSLineBreakByTruncatingTail;
    [PopView addSubview:labHead];
    
    
    //标签循环创建
    
    
    NSArray *Arryflag=[NSArray arrayWithObjects:@"您要新增的标签是：",@"简述您的理由：",@"姓名：",@"联系方式：",nil];
    NSArray *Arryplace=[NSArray arrayWithObjects:@"必选",@"可选",@"有可能获得官方送出的奖品",@"有可能获得官方送出的奖品",nil];
    for (int i = 0 ; i < 4; i++)
    {
        int Start_X =LEFTSIZE;
        int Star_Y =CGRectGetMaxY(labHead.frame)+LRYScreenpH(40);
        int Button_Width =LRYScreenpW(250);
        int Button_Heigt =LRYScreenpH(30);
        int Width_Space =Button_Width+LRYScreenpW(10);
        int Heigt_Space =Button_Heigt+LRYScreenpH(20);
        //设置一行几个 几行
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        // 标题
        UILabel *labflag = [[UILabel alloc]initWithFrame:CGRectMake(Start_X, Star_Y+Heigt_Space*i, Button_Width, Button_Heigt)];
        labflag.tag = 1000+i;
        [labflag setText:Arryflag[i]];
        [labflag setTextColor:[UIColor blackColor]];
        [labflag setTextAlignment:NSTextAlignmentRight];
        [labflag setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        [PopView addSubview:labflag];
        //输入框
        UITextField *textfield =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labflag.frame)+LRYScreenpW(10), CGRectGetMinY(labflag.frame)+LRYScreenpH(2), CGRectGetWidth(PopView.frame)-(2*LEFTSIZE)-CGRectGetWidth(labflag.frame), CGRectGetHeight(labflag.frame))];
        [textfield setTextColor:[UIColor blackColor]];
        textfield.delegate=self;
        textfield.tag =1004+i;
        textfield.backgroundColor = [UIColor whiteColor];
        textfield.placeholder = Arryplace[i];
        [textfield setValue:WYKColor(175, 175, 175, 1) forKeyPath:@"_placeholderLabel.textColor"];//颜色
        [textfield setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        textfield.textAlignment = NSTextAlignmentLeft;
        textfield.keyboardType = UIKeyboardTypeDefault;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchBarTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:textfield];
        [PopView addSubview:textfield];

        UILabel *Line = [[UILabel alloc]initWithFrame:CGRectMake(textfield.frame.origin.x, CGRectGetMaxY(textfield.frame)+LRYScreenpH(1), CGRectGetWidth(textfield.frame), LRYScreenpH(1))];
        [Line setBackgroundColor:WYKColor(175, 175, 175, 1)];
        [PopView addSubview:Line];
        
        
        
    }

    //提交按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(LEFTSIZE, CGRectGetMaxY(labHead.frame)+LRYScreenpH(260), CGRectGetWidth(PopView.frame)-LEFTSIZE*2, LRYScreenpH(80))];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:3];
    [btn setTitle:@"提交审核" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn setBackgroundColor:WYKColor(234, 58, 57, 1)];
    [btn addTarget:self action:@selector(AppleClick) forControlEvents:UIControlEventTouchUpInside];
    [PopView addSubview:btn];

    
    [self addSubview:PopView];
}


-(void)SearchBarTextFieldDidChange
{
    
}
////点击界面空白处退出
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITextField *textfield = [self.view viewWithTag:];
//    [textfield resignFirstResponder];
//}
//#pragma makr --UITextFieldDelegate
////UITextField的代理方法，点击键盘return按钮退出键盘
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    UITextField *textfield = [self.view viewWithTag:10000];
//    [textfield resignFirstResponder];
//    return YES;
//}
-(void)AppleClick
{
    [self removeFromSuperview];
}
@end
