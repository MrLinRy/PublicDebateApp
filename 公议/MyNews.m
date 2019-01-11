//
//  MyNews.m
//  公议
//
//  Created by Mr.Lin on 18/1/1.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "MyNews.h"
#import "ViewManger.h"
#import "SizeHeader.h"
#import "NewsMode.h"
#import "MyNewsView.h"
#define LEFTSIZE LRYScreenpH(40)
@interface MyNews ()<UITableViewDelegate,UITableViewDataSource,BaseCellButtonDelegete>
{
    NSMutableArray *ArryNews;
    int a;
}
@property (nonatomic,strong) UITableView *tableView;

@end



@implementation MyNews



-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,LRYScreenpH(740)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight =LRYScreenpH(100);
        _tableView.rowHeight=UITableViewAutomaticDimension;
        
    }
    return _tableView;
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
    a=7;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_home.png"]]];
    [self setBBgColor:[UIColor clearColor]];
    [self setBTitleString:@"我的消息" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:[UIColor whiteColor]];
    [self setTitleBgcolor:[UIColor clearColor]];
    
    UIView *bgview =[[UIView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10))];
    [bgview setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bgview];
    
    UILabel *Labnonthing=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/4, LRYScreenpH(50), ScreenWidth/2, LRYScreenpH(30))];
    Labnonthing.text =@"暂无消息~";
    [Labnonthing setTextAlignment:NSTextAlignmentCenter];
    [Labnonthing setTextColor:[UIColor blackColor]];
    [Labnonthing setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    [bgview addSubview:Labnonthing];
    [bgview addSubview:self.tableView];
    
   
    UILabel *LabNotice =[[UILabel alloc]initWithFrame:CGRectMake(7*LEFTSIZE, CGRectGetMaxY(self.tableView.frame)+LRYScreenpH(30), ScreenWidth-14*LEFTSIZE, LRYScreenpH(50))];
    [LabNotice setText:@"游戏公告"];
    [LabNotice setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
    
    [LabNotice setTextAlignment:NSTextAlignmentCenter];
    [LabNotice setTextColor:WYKColor(255, 0, 0, 1)];
    [LabNotice setBackgroundColor:[UIColor whiteColor]];
    [LabNotice.layer setMasksToBounds:YES];
    [LabNotice.layer setBorderWidth:1];
    [LabNotice.layer setBorderColor:WYKColor(255, 0, 0, 1).CGColor];
    [LabNotice.layer setCornerRadius:4];
    
    
    UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(4*LEFTSIZE, CGRectGetMaxY(self.tableView.frame)+LRYScreenpH(55), ScreenWidth-LEFTSIZE*8, LRYScreenpH(2))];
    [Line setBackgroundColor:WYKColor(255, 0, 0, 1)];
    [bgview addSubview:Line];
    [bgview addSubview:LabNotice];
    
    //消息
    NewsMode *New_0=[[NewsMode alloc]init];
    New_0.StrHead =@"photo_11.png";
    New_0.Name =@"私家车早上好";
    New_0.Date =@"2016-8-10";
    New_0.Time=@"07:00~10:00";
    
    NewsMode *New_1=[[NewsMode alloc]init];
    New_1.StrHead =@"photo_22.png";
    New_1.Name =@"惊喜拍档";
    New_1.Date =@"2016-8-10";
    New_1.Time=@"10:00~11:00";
    
    NewsMode *New_2=[[NewsMode alloc]init];
    New_2.StrHead =@"photo_33.png";
    New_2.Name =@"城市私家车";
    New_2.Date =@"2016-8-10";
    New_2.Time=@"11:00~12:00";

    NewsMode *New_3=[[NewsMode alloc]init];
    New_3.StrHead =@"photo_44.png";
    New_3.Name =@"岛姐叨叨叨";
    New_3.Date =@"2016-8-10";
    New_3.Time=@"13:00~15:00";

    NewsMode *New_4=[[NewsMode alloc]init];
    New_4.StrHead =@"photo_55.png";
    New_4.Name =@"周王秀";
    New_4.Date =@"2016-8-10";
    New_4.Time=@"16:00~17:00";

    
    ArryNews =[NSMutableArray arrayWithObjects: New_0,New_1,New_2,New_3,New_4, nil];

    
}

#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
    UIView *footView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(20))];
    [footView setBackgroundColor:WYKColor(247, 247, 247, 1)];
    return footView;
}
#pragma mark-------区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return LRYScreenpH(20);
}
#pragma mark-------行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return LRYScreenpH(141);
}
#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"CellID";
    MyNewsView *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    if (CellView == nil)
    {
        CellView =[[MyNewsView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        [CellView setBackgroundColor:[UIColor clearColor]];
        
    }
    CellView.selectionStyle=UITableViewCellSelectionStyleNone;
    NewsMode *New_0=ArryNews[indexPath.row];
    [CellView setHeadimageText:New_0.StrHead DateText:New_0.Date TimeText:New_0.Time nameText:New_0.Name];
    
    return CellView;
}


-(void)LeaveWordClick:(MyNewsView *)cell button:(UIButton *)sender
{
    NSLog(@"  ");
}

@end
