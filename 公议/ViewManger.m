//
//  ViewManger.m
//  10.21
//
//  Created by Mr.Lin on 17/10/21.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "ViewManger.h"
#import "ViewController.h"
@implementation ViewManger

@synthesize Navigationcontroler = _navigationcontroler;

static  ViewManger * mInstance;

+(instancetype)ShareInstance
{
    if (mInstance==nil)
    {
        mInstance=[[ViewManger alloc]init];
    }
    return mInstance;
}


-(instancetype)init
{
    self=[super init];
    if (self)
    {
        //ViewController * vie = [[ViewController alloc]init];
        _navigationcontroler =[[UINavigationController alloc]init];
        _navigationcontroler.navigationBar.hidden=YES;
        _navigationcontroler.interactivePopGestureRecognizer.enabled =NO;
        
    }
    return self;
}
@end
