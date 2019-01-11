//
//  SidetableCell.m
//  公议
//
//  Created by Mr.Lin on 17/12/16.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "SidetableCell.h"
#import "SizeHeader.h"
#define HEADIMAGE 1000
#define LABE 1001
@implementation SidetableCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.backgroundColor=[UIColor clearColor];
        UIImageView *Headimage=[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(30), LRYScreenpH(40), LRYScreenpW(100), LRYScreenpH(100))];
        Headimage.backgroundColor=[UIColor clearColor];
        Headimage.contentMode = UIViewContentModeScaleToFill;
        [Headimage.layer setMasksToBounds:YES];
        [Headimage.layer setCornerRadius:CGRectGetWidth(Headimage.frame)/2];
        Headimage.tag =HEADIMAGE;
        [self addSubview:Headimage];
        
        
        UILabel *labe=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(Headimage.frame)+LRYScreenpW(15), CGRectGetMidY(Headimage.frame)-LRYScreenpH(15), LRYScreenpW(440), LRYScreenpH(40))];
        labe.tag =LABE;
        labe.backgroundColor=[UIColor clearColor];
        [labe setTextColor:[UIColor whiteColor]];
        [labe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
        labe.textAlignment=NSTextAlignmentLeft;
        [self addSubview:labe];
        
        
    }
    return self;
}



-(void)setLabeText:(NSString *)str
{
    UILabel *labe=[self viewWithTag:LABE];
    labe.text=str;
}

-(void)setImageText:(NSString *)str
{
   UIImageView *Headimage=[self viewWithTag:HEADIMAGE];
    [Headimage setImage:[UIImage imageNamed:str]];
}
@end
