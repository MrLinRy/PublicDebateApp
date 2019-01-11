//
//  BaseViewController.h
//  20171029 -- Mr.Lin
//
//  Created by Mr.Lin on 17/10/30.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SizeHeader.h"
#import "TopBarView.h"
#import "ViewManger.h"
@interface BaseViewController : UIViewController<TopBarViewDelegate>
{
    TopBarView * topbar;
    //NSMutableArray * line_arr;
}
@property (nonatomic,strong) NSTimer * time;
-(void)show;

/*
-(UIView *)CreateSegViewWithHight:(double)height andPointY:(double)y andBgColor:(UIColor *)color andNumbersForButton:(int)number andButtons:(NSMutableArray *)button;
 */


-(UIButton *)CreateButtonWithFrame:(CGRect )frame andImage:(UIImage *)image andTitle:(NSString *)title andTitleColor:(UIColor *)color andFont:(UIFont *)font andBgImage:(UIImage *)bgimage;
-(UIImageView *)CreateLabelWithFrame:(CGRect )frame andTitle:(NSString *)title andFont:(UIFont *)font andTitleColor:(UIColor*)color andBgImage:(UIImage *)image;

//背景相关参数
-(void)setBBgColor:(UIColor *)_Color;
-(void)setBBgImage:(UIImage *)image;
-(void)setBTopBarHeight:(CGFloat)height;
//标题相关参数
-(void)setBTitleString:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color;
-(void)setBTitleBgimage:(UIImage *)image;
-(void)setTitleBgcolor:(UIColor *)color;
//按钮相关参数
-(void)setBBackButtonTitle:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color;
-(void)setBBackButtonBgimage:(UIImage *)image;
-(void)setBBackButtonBgcolor:(UIColor *)color;
-(void)setBBackButtonHidden:(BOOL)hidden;
//底部描边
-(void)setBLineHeight:(CGFloat)_height andColor:(UIColor *)_color;
-(void)setBLineHidden:(BOOL)hidden;



@end
