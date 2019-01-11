//
//  MyCollectVC.m
//  公议
//
//  Created by Mr.Lin on 17/12/31.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "MyCollectVC.h"
#import "ViewManger.h"
#import "SizeHeader.h"
#import "CustomerMode.h"
#import "HomeTableViewCell_1.h"
#define LEFTSIZE LRYScreenpH(40)
#define BTNMORE  1001
@interface MyCollectVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *bgView;
    NSMutableArray *ArryCustomer;
    int a;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *bgtableView;

@end



@implementation MyCollectVC




-(UITableView *)bgtableView
{
    if (_bgtableView == nil)
    {
        _bgtableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _bgtableView.delegate=self;
        _bgtableView.dataSource=self;
        _bgtableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _bgtableView.estimatedRowHeight =LRYScreenpH(100);
        _bgtableView.rowHeight=UITableViewAutomaticDimension;
        [_bgtableView setBackgroundColor:WYKColor(247, 247, 247, 1)];
    }
    return _bgtableView;

}

-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(LEFTSIZE, CGRectGetMaxY(_bgtableView.frame)+LRYScreenpH(30), ScreenWidth-2*LEFTSIZE, ScreenHeight-TopAndSystemHeight-LRYScreenpH(18)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView setBackgroundColor:[UIColor clearColor]];
//        [_tableView.layer setMasksToBounds:YES];
//        [_tableView.layer setBorderWidth:0.5];
//        [_tableView.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
        [_tableView setScrollEnabled:NO];
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
    [self setBTitleString:@"我的收藏" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:[UIColor whiteColor]];
    [self setTitleBgcolor:[UIColor clearColor]];
    
    UILabel *Labnonthing=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/4, LRYScreenpH(50), ScreenWidth/2, LRYScreenpH(30))];
    Labnonthing.text =@"暂无收藏商家~";
    [Labnonthing setTextAlignment:NSTextAlignmentCenter];
    [Labnonthing setTextColor:[UIColor blackColor]];
    [Labnonthing setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    bgView =[[UIView alloc]initWithFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [bgView.layer setMasksToBounds:YES];
    [bgView.layer setBorderWidth:0.5];
    [bgView.layer setBorderColor:WYKColor(175, 175, 175, 1).CGColor];
    
    [self.view addSubview:self.bgtableView];
    [self.bgtableView addSubview:Labnonthing];
    [self.bgtableView addSubview:bgView];

    [self.bgtableView addSubview:self.tableView];
    


    
    //顾客信息
    CustomerMode *Customer1=[[CustomerMode alloc]init];
    Customer1.Headimagestr =@"photo_1.png";
    Customer1.Namestr=@"名媛养生SPA会所";
    Customer1.Dateilstr=@"我就是我不一样的烟火";
    Customer1.Dateilstr1=@"每一个动作都为了您的舒适";
    Customer1.Datestr =@"2016-07-21";
    Customer1.Comsumstr=@"1020391";
    Customer1.Supportstr =@"95%";
    
    CustomerMode *Customer2=[[CustomerMode alloc]init];
    Customer2.Headimagestr =@"photo_2.png";
    Customer2.Namestr=@"福建买买买电子商务有限公司";
    Customer2.Dateilstr=@"概率不是规律";
    Customer2.Dateilstr1=@"帮助别人就是帮助自己";
    Customer2.Datestr =@"2016-07-21";
    Customer2.Comsumstr=@"1020391";
    Customer2.Supportstr =@"98%";
    
    CustomerMode *Customer3=[[CustomerMode alloc]init];
    Customer3.Headimagestr =@"photo_3.png";
    Customer3.Namestr=@"银河动漫演艺";
    Customer3.Dateilstr=@"会哭的猫";
    Customer3.Dateilstr1=@"哭泣如果能换来掌声";
    Customer3.Datestr =@"2016-07-21";
    Customer3.Comsumstr=@"1020391";
    Customer3.Supportstr =@"92%";
    
    CustomerMode *Customer4=[[CustomerMode alloc]init];
    Customer4.Headimagestr =@"photo_4.png";
    Customer4.Namestr=@"大家乐商务简餐馆";
    Customer4.Dateilstr=@"小米粒";
    Customer4.Dateilstr1=@"我会将宾至如归演绎得淋漓尽致";
    Customer4.Datestr =@"2016-07-21";
    Customer4.Comsumstr=@"1020391";
    Customer4.Supportstr =@"95%";
    
    CustomerMode *Customer5=[[CustomerMode alloc]init];
    Customer5.Headimagestr =@"photo_1.png";
    Customer5.Namestr=@"名媛养生SPA会所";
    Customer5.Dateilstr=@"我就是我不一样的烟火";
    Customer5.Dateilstr1=@"每一个动作都为了您的舒适";
    Customer5.Datestr =@"2016-07-21";
    Customer5.Comsumstr=@"1020391";
    Customer5.Supportstr =@"95%";
    
    CustomerMode *Customer6=[[CustomerMode alloc]init];
    Customer6.Headimagestr =@"photo_2.png";
    Customer6.Namestr=@"福建买买买电子商务有限公司";
    Customer6.Dateilstr=@"概率不是规律";
    Customer6.Dateilstr1=@"帮助别人就是帮助自己";
    Customer6.Datestr =@"2016-07-21";
    Customer6.Comsumstr=@"1020391";
    Customer6.Supportstr =@"98%";
    
    CustomerMode *Customer7=[[CustomerMode alloc]init];
    Customer7.Headimagestr =@"photo_3.png";
    Customer7.Namestr=@"银河动漫演艺";
    Customer7.Dateilstr=@"会哭的猫";
    Customer7.Dateilstr1=@"哭泣如果能换来掌声";
    Customer7.Datestr =@"2016-07-21";
    Customer3.Comsumstr=@"1020391";
    Customer7.Supportstr =@"92%";
    
    ArryCustomer =[NSMutableArray arrayWithObjects: Customer1,Customer2,Customer3,Customer4,Customer5,Customer6,Customer7, nil];

   
    
}
#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.bgtableView)
    {
        return 1;
    }
    else
    {
        if (a == 7)
        {
            return 2;
        }
        else
        {
            return 1;
        }
    }
   }
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.bgtableView)
    {
        return 14;
    }
    else
    {
        if (section == 0 )
        {
            return ArryCustomer.count;
        }
        else
        {
            return 1;
        }
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
    if (tableView ==self.bgtableView  )
    {
        return LRYScreenpH(100);
    }
    else
    {
        if (indexPath.section == 0)
        {
            return LRYScreenpH(160);
        }
        else
        {
            return LRYScreenpH(80);
        }

    }
    
}
#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.bgtableView)
    {
        static NSString *CellID0 = @"CellID0";
        UITableViewCell *CellView0 =[tableView dequeueReusableCellWithIdentifier:CellID0];
        if (CellView0 == nil)
        {
            CellView0 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID0];
            [CellView0 setBackgroundColor:[UIColor clearColor]];
            
        }
        CellView0.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView0;

    }
    else
    {
        if (indexPath.section == 1)
        {
            static NSString *CellID1 = @"CellID1";
            UITableViewCell *CellView1 =[tableView dequeueReusableCellWithIdentifier:CellID1];
            if (CellView1 == nil)
            {
                CellView1 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID1];
                [CellView1 setBackgroundColor:[UIColor clearColor]];
                UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(520), LRYScreenpH(20), LRYScreenpW(130), LRYScreenpH(30))];
                btn.tag = BTNMORE;
                [btn setTitle:@"显示更多>" forState:UIControlStateNormal];
                [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
                [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [btn setBackgroundColor:[UIColor whiteColor]];
                [btn addTarget:self action:@selector(ShowMoreClick) forControlEvents:UIControlEventTouchUpInside];
                [CellView1 addSubview:btn];

            }
            
            CellView1.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView1;
            
        }
        else
        {
            static NSString *CellID = @"CellID";
            HomeTableViewCell_1 *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                
                CellView =[[HomeTableViewCell_1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            }
            CellView.delegate=self;
            CustomerMode *Customer=ArryCustomer[indexPath.row];
            [CellView setImageText:Customer.Headimagestr];
            [CellView setNameLabeText:Customer.Namestr DetailLabeText:Customer.Dateilstr DetailLabe1Text:Customer.Dateilstr1 DateLabeText:Customer.Datestr ComeSumLabeText:Customer.Comsumstr SupportLabeText:Customer.Supportstr];
            [CellView setbtntitle:@"取消收藏"];
            

            return CellView;
            
        }

    }
    
}
-(void)ShowMoreClick
{
    
}
-(void)LeaveWordClick:(HomeTableViewCell_1 *)cell button:(UIButton *)sender
{
    
    a--;
    NSIndexPath *index =[self.tableView indexPathForCell:cell];
    [ArryCustomer removeObjectAtIndex:index.row];
    [self.tableView reloadData];
    [bgView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height-(7-a)*LRYScreenpH(160)-LRYScreenpH(80))];
}



@end
