//
//  SearchBarTextField.m
//  国庆作业
//
//  Created by Mr.Lin on 17/10/10.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "SearchBarTextField.h"
#define LRYScreenpW(ww)  ww*([[UIScreen mainScreen] bounds].size.width)/750
#define LRYScreenpH(hh)  hh*([[UIScreen mainScreen] bounds].size.height)/1334
#define LRYUIColorFromRGB(rgbValue,a) [UIColor colorWithRed:(((rgbValue & 0xFF0000 ) >>16))/255.0 green:(((rgbValue & 0x00FF00) >>8))/255.0 blue:((rgbValue & 0x0000FF))/255.0 alpha:a]

@implementation SearchBarTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 设置默认字体
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder =  @"搜索学校";
        // 设置默认颜色
        self.placeholderColor = LRYUIColorFromRGB(0xc1c1c1, 1.0) ;
        // 使用通知监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
*/
/*
-(void)textDidChange:(NSNotification *)note
{
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    // 如果有文字，就直接返回，不需要画占位文字
    if (self.hasText) return;
    // 属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
    // 画文字
    rect.origin.x += 40;
    [self.placeholder drawInRect:rect withAttributes:attrs];
}
*/
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 20;
    return iconRect;
}

-(CGRect)rightViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 0;
    return iconRect;
    
}



//  重写占位符的x值
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
        CGRect placeholderRect = [super placeholderRectForBounds:bounds];
        placeholderRect.origin.x = 40;
        return placeholderRect;
}
//  重写文字输入时的x值
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect editingRect = [super editingRectForBounds:bounds];
    editingRect.origin.x +=40;
    return editingRect;
}

//  重写文字显示时的x值
- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect textRect = [super editingRectForBounds:bounds];
    textRect.origin.x = 40;
    return textRect;
}
@end
