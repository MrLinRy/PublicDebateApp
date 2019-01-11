//
//  MyJudgeVC.m
//  公议
//
//  Created by Mr.Lin on 18/1/5.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "MyJudgeVC.h"
#import "ViewManger.h"
#import "SizeHeader.h"
#define LEFTSIZE LRYScreenpH(40)
@interface MyJudgeVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *bgview1;
    UIView *bgview2;
}

@property (nonatomic,strong) UITableView *bgtableView;
@property (nonatomic,strong) UITableView *tableView1;
@property (nonatomic,strong) UITableView *tableView2;
@end



@implementation MyJudgeVC

-(UITableView *)bgtableView
{
    if (_bgtableView == nil)
    {
        _bgtableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth,ScreenHeight) style:UITableViewStylePlain];
        [_bgtableView setBackgroundColor:WYKColor(247, 247, 247, 1)];
        _bgtableView.delegate=self;
        _bgtableView.dataSource=self;
        _bgtableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _bgtableView.estimatedRowHeight =LRYScreenpH(100);
        _bgtableView.rowHeight=UITableViewAutomaticDimension;
        
    }
    return _bgtableView;
}


-(UITableView *)tableView1
{
    if (_tableView1 == nil)
    {
        _tableView1 =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bgview1.frame),CGRectGetHeight(bgview1.frame)) style:UITableViewStylePlain];
        _tableView1.delegate=self;
        _tableView1.dataSource=self;
        _tableView1.scrollEnabled=NO;
        _tableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView1.estimatedRowHeight =LRYScreenpH(100);
        _tableView1.rowHeight=UITableViewAutomaticDimension;
        
    }
    return _tableView1;
}

-(UITableView *)tableView2
{
    if (_tableView2 == nil)
    {
        _tableView2 =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bgview2.frame),CGRectGetHeight(bgview2.frame)) style:UITableViewStylePlain];
        _tableView2.delegate=self;
        _tableView2.dataSource=self;
        _tableView2.scrollEnabled=NO;
        _tableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView2.estimatedRowHeight =LRYScreenpH(100);
        _tableView2.rowHeight=UITableViewAutomaticDimension;
        
    }
    return _tableView2;
}

-(instancetype)init
{
    self=[super init];
    if (self)
    {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_home.png"]]];
    [self setBBgColor:[UIColor clearColor]];
    [self setBTitleString:@"公议扫码" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:[UIColor whiteColor]];
    [self setTitleBgcolor:[UIColor clearColor]];
    
    [self.view addSubview:self.bgtableView];
    
    bgview1 =[[UIView alloc]initWithFrame:CGRectMake(LEFTSIZE, CGRectGetMaxY(bgview1.frame)+LRYScreenpH(30), ScreenWidth-LEFTSIZE*2, LRYScreenpH(620))];
    [bgview1 setBackgroundColor:[UIColor whiteColor]];
    [bgview1.layer setMasksToBounds:YES];
    [bgview1.layer setBorderWidth:0.5];
    [bgview1.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
    [self.bgtableView addSubview:bgview1];
    
    
    bgview2 =[[UIView alloc]initWithFrame:CGRectMake(LEFTSIZE, CGRectGetMaxY(bgview1.frame)+LRYScreenpH(30), ScreenWidth-LEFTSIZE*2, LRYScreenpH(560))];
    [bgview2 setBackgroundColor:[UIColor whiteColor]];
    [bgview2.layer setMasksToBounds:YES];
    [bgview2.layer setBorderWidth:0.5];
    [bgview2.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
    [self.bgtableView addSubview:bgview2];
    
    [bgview1 addSubview:self.tableView1];
    [bgview2 addSubview:self.tableView2];
}

#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==self.bgtableView) {
        return 1;
    }
    else
    {
        return 3;
    }

}
#pragma mark-------区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0;
}
#pragma mark-------行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView ==self.bgtableView)
    {
        return ScreenHeight-TopAndSystemHeight-LRYScreenpH(10);
    }
    else if(tableView == self.tableView1)
    {
        if (indexPath.row == 0)
        {
            return LRYScreenpH(71);
        }
        else if (indexPath.row == 1)
        {
            return LRYScreenpH(481);
        }
        else
        {
            return LRYScreenpH(71);
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            return LRYScreenpH(71);
        }
        else if (indexPath.row == 1)
        {
            return LRYScreenpH(280);
        }
        else
        {
            return LRYScreenpH(201);
        }
    }
}
#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.bgtableView)
    {
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            [CellView setBackgroundColor:[UIColor clearColor]];
            
        }
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return CellView;
    }
    else if (tableView == self.tableView1)
    {
        if (indexPath.row == 0)
        {
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                UILabel *HeadLab =[[UILabel alloc]initWithFrame:CGRectMake(LEFTSIZE*2, LRYScreenpH(20), CGRectGetWidth(bgview1.frame)-LEFTSIZE*4, LRYScreenpH(30))];
                HeadLab.text=@"如果你不想继续一下内容，可点击结束评价";
                [HeadLab setTextAlignment:NSTextAlignmentCenter];
                [HeadLab setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
                [HeadLab setTextColor:WYKColor(175, 175, 175, 1)];
                UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(HeadLab.frame)+LRYScreenpH(20), CGRectGetWidth(bgview1.frame), LRYScreenpH(1))];
                [Line setBackgroundColor:WYKColor(175, 175, 175, 1)];
                [CellView addSubview:HeadLab];
                [CellView addSubview:Line];
                
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            
            return CellView;

        }
        else if (indexPath.row ==1)
        {
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            
            return CellView;

        }
        else
        {
            static NSString *CellID_2 = @"CellID_2";
            UITableViewCell *CellView_2 =[tableView dequeueReusableCellWithIdentifier:CellID_2];
            if (CellView_2 == nil)
            {
                CellView_2 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID_2];
                [CellView_2 setBackgroundColor:[UIColor clearColor]];
                UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(200), 0, CGRectGetWidth(bgview1.frame)-LRYScreenpW(400), LRYScreenpH(40))];
                [btn setTitle:@"点击展开更多维度" forState:UIControlStateNormal];
                [btn setTitleColor:WYKColor(175, 175, 175, 1) forState:UIControlStateNormal];
                [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
                [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
                [CellView_2 addSubview:btn];
            }
            CellView_2.selectionStyle=UITableViewCellSelectionStyleNone;
            
            return CellView_2;

        }
        
    }
    else
    {
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            [CellView setBackgroundColor:[UIColor clearColor]];
            
        }
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return CellView;
    }
}



@end
