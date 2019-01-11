//
//  HomeTableViewCell_1.m
//  公议
//
//  Created by Mr.Lin on 17/12/19.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "HomeTableViewCell_1.h"
#import "SizeHeader.h"
#define HEADIMAGE 1000
#define NAMELABE 1001
#define DETAILLABE1 1002
#define DETAILLABE2 1003
#define DATE  1004
#define COMSUM  1005
#define SUPPORT  1006
#define BTN  1007




@implementation HomeTableViewCell_1



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.backgroundColor=[UIColor clearColor];
        
        UIImageView *Headimage=[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(20), LRYScreenpH(20), LRYScreenpW(110), LRYScreenpH(110))];
        Headimage.contentMode = UIViewContentModeScaleToFill;
        [Headimage.layer setMasksToBounds:YES];
        [Headimage.layer setCornerRadius:4];
        Headimage.tag =HEADIMAGE;
        [self addSubview:Headimage];
        

        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(Headimage.frame.origin.y+Headimage.frame.size.width+LRYScreenpW(390), Headimage.frame.origin.y+LRYScreenpH(5), LRYScreenpW(130), LRYScreenpH(40))];
        btn.tag =BTN;
        [btn setTitle:@"给Ta留言" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
        [btn.titleLabel setTextColor:[UIColor whiteColor]];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:6];
        [btn setBackgroundColor:WYKColor(255, 0, 0, 1)];
        [btn addTarget:self action:@selector(leavewordClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
        UILabel *namelabe=[[UILabel alloc]initWithFrame:CGRectMake(Headimage.frame.origin.x+Headimage.frame.size.width+LRYScreenpH(20), Headimage.frame.origin.y, LRYScreenpW(380), LRYScreenpH(30))];
        namelabe.tag =NAMELABE;
        namelabe.backgroundColor=[UIColor clearColor];
        [namelabe setTextColor:[UIColor blackColor]];
        [namelabe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        namelabe.textAlignment=NSTextAlignmentLeft;
        [self addSubview:namelabe];
        
        UILabel *detaillabe1=[[UILabel alloc]initWithFrame:CGRectMake(Headimage.frame.origin.x+Headimage.frame.size.width+LRYScreenpH(20), namelabe.frame.origin.y+namelabe.frame.size.height+LRYScreenpH(20), LRYScreenpW(360), LRYScreenpH(20))];
        detaillabe1.tag =DETAILLABE1;
        detaillabe1.backgroundColor=[UIColor clearColor];
        [detaillabe1 setTextColor:WYKColor(175, 175, 175, 1)];
        [detaillabe1 setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
        detaillabe1.textAlignment=NSTextAlignmentLeft;
        [self addSubview:detaillabe1];
        
        UILabel *detaillabe2=[[UILabel alloc]initWithFrame:CGRectMake(Headimage.frame.origin.x+Headimage.frame.size.width+LRYScreenpH(20), detaillabe1.frame.origin.y+detaillabe1.frame.size.height+LRYScreenpH(10), LRYScreenpW(360), LRYScreenpH(20))];
        detaillabe2.tag =DETAILLABE2;
        detaillabe2.backgroundColor=[UIColor clearColor];
        [detaillabe2 setTextColor:WYKColor(175, 175, 175, 1)];
        [detaillabe2 setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
        detaillabe2.textAlignment=NSTextAlignmentLeft;
        [self addSubview:detaillabe2];
        
        UILabel *datelab=[[UILabel alloc]initWithFrame:CGRectMake(Headimage.frame.origin.x+Headimage.frame.size.width+LRYScreenpH(20), detaillabe2.frame.origin.y+detaillabe2.frame.size.height+LRYScreenpH(15), LRYScreenpW(180), LRYScreenpH(20))];
        datelab.tag =DATE;
        datelab.backgroundColor=[UIColor clearColor];
        [datelab setTextColor:WYKColor(175, 175, 175, 1)];
        [datelab setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(10)]];
        datelab.textAlignment=NSTextAlignmentLeft;
        [self addSubview:datelab];

        UILabel *comsumlab=[[UILabel alloc]initWithFrame:CGRectMake(datelab.frame.origin.x+datelab.frame.size.width+LRYScreenpH(40), datelab.frame.origin.y, LRYScreenpW(140), LRYScreenpH(20))];
        comsumlab.tag =COMSUM;
        comsumlab.backgroundColor=[UIColor clearColor];
        [comsumlab setTextColor:WYKColor(175, 175, 175, 1)];
        [comsumlab setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(10)]];
        comsumlab.textAlignment=NSTextAlignmentLeft;
        [self addSubview:comsumlab];
        
        UILabel *supportlab=[[UILabel alloc]initWithFrame:CGRectMake(comsumlab.frame.origin.x+comsumlab.frame.size.width+LRYScreenpH(30), datelab.frame.origin.y, LRYScreenpW(120), LRYScreenpH(20))];
        supportlab.tag =SUPPORT;
        supportlab.backgroundColor=[UIColor clearColor];
        [supportlab setTextColor:WYKColor(175, 175, 175, 1)];
        [supportlab setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(10)]];
        supportlab.textAlignment=NSTextAlignmentLeft;
        [self addSubview:supportlab];

        UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(Headimage.frame.origin.x+Headimage.frame.size.width, datelab.frame.origin.y+datelab.frame.size.height+LRYScreenpH(8), self.frame.size.width-Headimage.frame.size.width+LRYScreenpW(30), LRYScreenpH(2))];
        [Line setBackgroundColor:WYKColor(247, 247, 247, 1)];
        [self addSubview:Line];
        
    }
    return self;
}


-(void)setNameLabeText:(NSString *)namestr  DetailLabeText:(NSString *)str  DetailLabe1Text:(NSString *)str1 DateLabeText:(NSString *)datestr  ComeSumLabeText:(NSString *)comsumstr SupportLabeText:(NSString *)supportstr
{
    UILabel *namelabe=[self viewWithTag:NAMELABE];
    namelabe.text=namestr;
    
    UILabel *DetailLabe=[self viewWithTag:DETAILLABE1];
    DetailLabe.text=str;
    
    UILabel *DetailLabe1=[self viewWithTag:DETAILLABE2];
    DetailLabe1.text=str1;
    
    NSString *Date =[NSString stringWithFormat:@"注册于：%@",datestr];
    UILabel *DateLabe=[self viewWithTag:DATE];
    DateLabe.text=Date;
    
    NSString *Comsum =[NSString stringWithFormat:@"%@次评论",comsumstr];
    UILabel *ComeSumLabe=[self viewWithTag:COMSUM];
    ComeSumLabe.text=Comsum;
    
    NSString *Support =[NSString stringWithFormat:@"支持率：%@",supportstr];
    UILabel *SupportLabe=[self viewWithTag:SUPPORT];
    SupportLabe.text=Support;
}

-(void)setImageText:(NSString *)str
{
    UIImageView *Headimage=[self viewWithTag:HEADIMAGE];
    [Headimage setImage:[UIImage imageNamed:str]];
}

-(void)setbtntitle:(NSString *)str
{
    UIButton *btn =[self viewWithTag:BTN];
    [btn setTitle:str forState:UIControlStateNormal];
}

//按钮代理行为
-(void)leavewordClick:(UIButton *)sender
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(LeaveWordClick:button:)])
    {
        
        [_delegate LeaveWordClick:self button:sender];
    }
}


@end
