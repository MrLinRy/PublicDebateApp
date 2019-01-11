//
//  BaseViewController.m
//  20171029 -- Mr.Lin
//
//  Created by Mr.Lin on 17/10/30.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * statuBg=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,20)];
    statuBg.backgroundColor=[UIColor clearColor];
    [self.view addSubview:statuBg];
    topbar=[[TopBarView alloc]init];
    topbar.delegate=self;
    [self.view addSubview:topbar];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)show
{
    [[ViewManger ShareInstance].Navigationcontroler pushViewController:self animated:YES];
}






-(void)backActionOfDelegate
{
    [[ViewManger ShareInstance].Navigationcontroler popViewControllerAnimated:YES];
}


/*
-(UIView *)CreateSegViewWithHight:(double)height andPointY:(double )y  andBgColor:(UIColor *)color andNumbersForButton:(int)number andButtons:(NSMutableArray *)button
{
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(0,y, ScreenWidth,height )];
    line_arr = [[NSMutableArray alloc]initWithCapacity:15];
    bgview.backgroundColor=color;
    for (int i=0; i<number; i++)
    {
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/number*i,height*FitHeight(15/80), 40.0f,height*FitHeight(50/80))];
        line.backgroundColor=UIColorRGB(217);
        [line_arr addObject:[line copy]];
//对象无法长久保存，无解。。。。
        [bgview addSubview:line_arr[i]];
    }
    return bgview;
}

*/


-(UIButton *)CreateButtonWithFrame:(CGRect )frame andImage:(UIImage *)image andTitle:(NSString *)title andTitleColor:(UIColor *)color andFont:(UIFont *)font andBgImage:(UIImage *)bgimage
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundImage:bgimage forState:UIControlStateNormal];
    btn.titleLabel.font=font;
    return btn;
    
}
-(UIImageView *)CreateLabelWithFrame:(CGRect )frame andTitle:(NSString *)title andFont:(UIFont *)font andTitleColor:(UIColor*)color andBgImage:(UIImage *)image
{
    
    
    UIImageView * ima = [[UIImageView alloc]initWithFrame:frame];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(ima.frame), CGRectGetHeight(ima.frame))];
    ima.image=image;
    lab.textAlignment=NSTextAlignmentLeft;
    lab.text=title;
    lab.font=font;
    lab.textColor=color;
    lab.backgroundColor=WYKColor(255, 255, 255, 0);
    [ima addSubview:lab];
    return ima;
}
#pragma mark -------------------- topbar参数

//背景相关参数
-(void)setBBgColor:(UIColor *)_Color
{
    [topbar setBgColor:_Color];
}
-(void)setBBgImage:(UIImage *)image
{
    [topbar setBgImage:image];
}
-(void)setBTopBarHeight:(CGFloat)height
{
    [topbar setTopBarHeight:height];
}
//标题相关参数
-(void)setBTitleString:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color
{
    [topbar setTitleString:_title andFont:_font andColor:_color];
}
-(void)setBTitleBgimage:(UIImage *)image
{
    [topbar setTitleBgimage:image];
}
-(void)setTitleBgcolor:(UIColor *)color
{
    [topbar setTitleBgcolor:color];
}
//按钮相关参数
-(void)setBBackButtonTitle:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color
{
    [topbar setBackButtonTitle:_title andFont:_font andColor:_color];
}
-(void)setBBackButtonBgimage:(UIImage *)image
{
    [topbar setBackButtonBgimage:image];
}
-(void)setBBackButtonBgcolor:(UIColor *)color
{
    [topbar setBackButtonBgcolor:color];
}
-(void)setBBackButtonHidden:(BOOL)hidden
{
    [topbar setBackButtonHidden:hidden];
}
//底部描边
-(void)setBLineHeight:(CGFloat)_height andColor:(UIColor *)_color
{
    [topbar setLineHeight:_height andColor:_color];
}
-(void)setBLineHidden:(BOOL)hidden
{
    [topbar setLineHidden:hidden];
}












/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
