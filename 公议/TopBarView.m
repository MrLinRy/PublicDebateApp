//
//  TopBarView.m
//  20171029 -- Mr.Lin
//
//  Created by Mr.Lin on 17/10/30.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "TopBarView.h"

@implementation TopBarView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.frame=CGRectMake(0, 20, ScreenWidth, TopAndSystemHeight+LRYScreenpH(1));
        self.backgroundColor=UIColorRGB(255);
        
        
        
        title=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-FitWidth(150), FitHeight(44-20), FitWidth(300), FitHeight(40))];
        [title setTextAlignment:NSTextAlignmentCenter];
        
        
        back=[UIButton buttonWithType:UIButtonTypeCustom];
        [back setImage:[UIImage imageNamed:@"back_blue@2x.png"] forState:UIControlStateNormal];
        back.frame=CGRectMake(FitWidth(20),FitHeight(30), FitWidth(20), FitHeight(30));
        [back addTarget:self action:@selector(_backAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        line=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, ScreenWidth, 1)];
        line.backgroundColor=WYKColor(217, 217, 217, 1);
        
        
        [self addSubview:title];
        [self addSubview:back];
        [self addSubview:line];
    }
    
    return self;
}


//背景相关参数
-(void)setBgColor:(UIColor *)_Color
{
    self.backgroundColor=_Color;
}
-(void)setBgImage:(UIImage *)image
{
    UIImageView * imagev=[[UIImageView alloc]initWithFrame:self.frame];
    imagev.image=image;
    [line removeFromSuperview];
    [title removeFromSuperview];
    [back removeFromSuperview];
    [imagev addSubview:line];
    [imagev addSubview:title];
    [imagev addSubview:back];
    [self addSubview:imagev];
}
-(void)setTopBarHeight:(CGFloat)height
{
    [self setFrame:CGRectMake(0, 0, ScreenWidth, FitHeight(height))];
}
//标题相关参数
-(void)setTitleString:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color
{
    title.text=_title;
    title.font=_font;
    title.textColor=_color;
}
-(void)setTitleBgimage:(UIImage *)image
{
    UIImageView * imagev=[[UIImageView alloc]initWithFrame:title.frame];
    imagev.image=image;
    title.backgroundColor=[UIColor clearColor];
    [title removeFromSuperview];
    [self addSubview:imagev];
    [self addSubview:title];
}
-(void)setTitleBgcolor:(UIColor *)color
{
    title.backgroundColor=color;
}
//按钮相关参数
-(void)setBackButtonTitle:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color
{
    [back setTitle:_title forState:UIControlStateNormal];
    back.titleLabel.font=_font;
    back.titleLabel.textColor=_color;
}
-(void)setBackButtonBgimage:(UIImage *)image
{
    [back setBackgroundImage:image forState:UIControlStateNormal];
}
-(void)setBackButtonBgcolor:(UIColor *)color
{
    [back setBackgroundColor:color];
}
-(void)setBackButtonHidden:(BOOL)hidden
{
    back.hidden=hidden;
}
//底部描边
-(void)setLineHeight:(CGFloat)_height andColor:(UIColor *)_color
{
    [line setFrame:CGRectMake(0, self.frame.size.height-1, ScreenWidth, _height)];
    line.backgroundColor=_color;
}
-(void)setLineHidden:(BOOL)hidden
{
    line.hidden=hidden;
}



//返回事件
-(void)_backAction:sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(backActionOfDelegate)])
    {
        [_delegate backActionOfDelegate];
    }
}






/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
