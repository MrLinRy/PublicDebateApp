//
//  TopBarView.h
//  20171029 -- Mr.Lin
//
//  Created by Mr.Lin on 17/10/30.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SizeHeader.h"
@protocol TopBarViewDelegate <NSObject>
@optional
-(void)backActionOfDelegate;
@end
@interface TopBarView : UIView
{
    UIView * line;
    UILabel * title;
    UIButton * back;
}
@property (nonatomic,retain) id<TopBarViewDelegate> delegate;

//背景相关参数
-(void)setBgColor:(UIColor *)_Color;
-(void)setBgImage:(UIImage *)image;
-(void)setTopBarHeight:(CGFloat)height;
//标题相关参数
-(void)setTitleString:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color;
-(void)setTitleBgimage:(UIImage *)image;
-(void)setTitleBgcolor:(UIColor *)color;
//按钮相关参数
-(void)setBackButtonTitle:(NSString *)_title andFont:(UIFont *)_font andColor:(UIColor *)_color;
-(void)setBackButtonBgimage:(UIImage *)image;
-(void)setBackButtonBgcolor:(UIColor *)color;
-(void)setBackButtonHidden:(BOOL)hidden;
//底部描边
-(void)setLineHeight:(CGFloat)_height andColor:(UIColor *)_color;
-(void)setLineHidden:(BOOL)hidden;
@end
