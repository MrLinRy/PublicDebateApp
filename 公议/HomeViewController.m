//
//  HomeViewController.m
//  公议
//
//  Created by Mr.Lin on 17/12/16.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "HomeViewController.h"
#import "SizeHeader.h"
#import "SearchBarTextField.h"
#import "HomeTableViewCell_1.h"
#import "CustomerMode.h"
#import "ApiManager.h"
#import "UniteCell.h"

#define  BTNMORE 1000
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,BaseCellButtonDelegete>
{
    UITableView *bgview;
    UIImageView *Listbgimage;
    UITableView *tableview1;
    UITableView *tableview2;
    NSMutableArray *ArryCustomer;
    UIView *tv2bgview;
    NSMutableArray *Cellstates;
    double HeightChange;
    
    
}
@property (nonatomic,strong)NSMutableArray *hyArry;
@property (nonatomic,strong)NSMutableArray *WDArry;
@property (nonatomic,strong)NSMutableArray *QYArry;
@property (nonatomic,strong)NSMutableArray *userArry;
@end



@implementation HomeViewController

-(NSMutableArray *)hyArry
{
    if (_hyArry ==nil)
    {
        _hyArry=[[NSMutableArray alloc]init];
    }
    return _hyArry;
    
}
-(NSMutableArray *)WDArry
{
    if (_WDArry ==nil)
    {
        _WDArry=[[NSMutableArray alloc]init];
    }
    return _WDArry;
    
}
-(NSMutableArray *)QYArry
{
    if (_QYArry ==nil)
    {
        _QYArry=[[NSMutableArray alloc]init];
    }
    return _QYArry;
    
}
-(NSMutableArray *)userArry
{
    if (_userArry ==nil)
    {
        _userArry=[[NSMutableArray alloc]init];
    }
    return _userArry;
    
}
-(instancetype)init
{
    self =[super init];
    if (self)
    {
        
        
#pragma mark--------设置导航栏
        UILabel *toplabe =[[UILabel alloc]initWithFrame:CGRectMake(0, SystemTopY-LRYScreenpH(5), ScreenWidth, TopBarHeight)];
        toplabe.backgroundColor=[UIColor clearColor];
        [toplabe setText:@"扫码公议"];
        toplabe.textAlignment=NSTextAlignmentCenter;
        [toplabe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)]];
        [toplabe setTextColor:[UIColor whiteColor]];
        [self.view addSubview:toplabe];
        
        
        
        
    }
    return self;
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //导航栏隐藏
    topbar.hidden=YES;
    UIImageView *bgimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [bgimage setImage:[UIImage imageNamed:@"background_home.png"]];
    [self.view addSubview:bgimage];
    
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];

#pragma mark--------------数据请求
    [self hygetinfo];
    [self getWDInfo];
    [self getQYInfo];
    [self getUserInfohName:@"" wdName:@"" Company:@"" key:@""];
#pragma mark-------------表背景  第一个表视图  第二个表视图
    
    
    bgview =[[UITableView alloc]initWithFrame:CGRectMake(0,TopAndSystemHeight+LRYScreenpH(10) , ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10))];
    [bgview setBackgroundColor:WYKColor(247, 247, 247, 1)];
    bgview.separatorStyle =UITableViewCellSeparatorStyleNone;
    bgview.delegate=self;
    bgview.dataSource=self;
    [self.view addSubview:bgview];
 
    Listbgimage =[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(40),LRYScreenpH(20),ScreenWidth-LRYScreenpW(80), LRYScreenpH(350))];
    [Listbgimage setImage:[UIImage imageNamed:@"commentbg.9.png"]];
    [bgview addSubview:Listbgimage];

    
    
    tableview1 =[[UITableView alloc]initWithFrame:CGRectMake(LRYScreenpW(80),LRYScreenpH(20),ScreenWidth-LRYScreenpW(160), Listbgimage.frame.size.height)];
    [tableview1 setBackgroundColor:[UIColor clearColor]];
    [tableview1 setScrollEnabled:NO];
    tableview1.separatorStyle =UITableViewCellSeparatorStyleNone;
    tableview1.delegate=self;
    tableview1.dataSource=self;
    [bgview addSubview:tableview1];
    
    
    tableview2 =[[UITableView alloc]initWithFrame:CGRectMake(LRYScreenpW(40),Listbgimage.frame.origin.y+Listbgimage.frame.size.height+LRYScreenpH(30) , Listbgimage.frame.size.width,LRYScreenpH(800))];
    [tableview2 setBackgroundColor:[UIColor clearColor]];
    [tableview2 setScrollEnabled:NO];
    tableview2.separatorStyle =UITableViewCellSeparatorStyleNone;
    tableview2.delegate=self;
    tableview2.dataSource=self;
   
    

    
    tv2bgview =[[UIView alloc]initWithFrame:CGRectMake(tableview2.frame.origin.x, tableview2.frame.origin.y+LRYScreenpH(90), tableview2.frame.size.width, tableview2.frame.size.height-LRYScreenpH(90))];
    [tv2bgview setBackgroundColor:[UIColor whiteColor]];
    [tv2bgview.layer setMasksToBounds:YES];
    [tv2bgview.layer setBorderWidth:0.5];
    [tv2bgview.layer setBorderColor:WYKColor(175, 175, 175, 1).CGColor];
    [bgview addSubview:tv2bgview];
    [bgview addSubview:tableview2];
    
    
    
    
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
    
    ArryCustomer =[[NSMutableArray alloc]initWithObjects:Customer1,Customer2,Customer3,Customer4, nil];
    
    
    Cellstates = [NSMutableArray arrayWithCapacity:4];
    
    //默认每一个section都是折叠的
   for(int i=0; i<4; i++)
   {
    NSNumber *state = [NSNumber numberWithBool:NO];
    [Cellstates addObject:state];
    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark--------tableview相关函数
//区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView ==bgview) {
        return 1;
    }
    else if(tableView == tableview1)
    {
        return 4;
    }
    else
    {
        return 1;
    }

}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==bgview)
    {
        return 1;
    }
    else if(tableView == tableview1)
    {
        if ([Cellstates[section] boolValue])
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 4;
    }
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView ==bgview)
    {
        return 0;
    }
    else if(tableView == tableview1)
    {
        if (section == 0)
        {
            return LRYScreenpH(130);
        }
        else
        {
            return LRYScreenpH(70);
        }
        
    }
    else
    {
        return LRYScreenpH(90);
    }
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==bgview)
    {
        return ScreenHeight-TopAndSystemHeight-LRYScreenpH(10)+HeightChange;
    }
    else if(tableView == tableview1)
    {
        return LRYScreenpH(100);
    }
    else
    {
        return LRYScreenpH(160);
    }
    
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView ==bgview)
    {
        return 0;
    }
    else if (tableView == tableview2)
    {
        return LRYScreenpH(70);
    }
    else if(tableView == tableview1)
    {
        if (section ==1 || section == 2)
        {
            return LRYScreenpH(1);
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return LRYScreenpH(70);
    }
}

//行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==bgview)
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
    else if(tableView == tableview1)
    {
        
        
       
        NSArray *PagLabeArry = [[NSArray alloc]initWithObjects:@"中餐",@"西餐",@"自助餐",@"糕点",@"烧烤",@"100人",@"连锁",@"店面",@"酒楼", @"50人/均",nil];
        NSArray *DimenLabeArry = [[NSArray alloc]initWithObjects:@"态度",@"专业",@"颜值",@"卫生",nil];
        NSArray *BusLabeArry = [[NSArray alloc]initWithObjects:@"海通上合",@"青衣",@"小鱼小牛",@"海底捞",nil];
        
        if (indexPath.section==1)
        {
            static NSString *CellID_0 = @"CellID_0";
            UITableViewCell *CellView_0 =[tableView dequeueReusableCellWithIdentifier:CellID_0];
            if (CellView_0 == nil)
            {
                
                CellView_0 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID_0];
                [CellView_0 setBackgroundColor:[UIColor clearColor]];
                //标签按钮循环创建
                int Start_X =0;
                int Star_Y =LRYScreenpH(10);
                int Button_Width =LRYScreenpW(100);
                int Button_Heigt =LRYScreenpH(30);
                int Width_Space =Button_Width+LRYScreenpW(20);
                int Heigt_Space =Button_Heigt+LRYScreenpH(20);
                for (int i = 0 ; i < 10; i++)
                {
                    //设置一行几个 几行
                    NSInteger index = i % 6;
                    NSInteger page = i / 6;
                    // 按钮
                    UIButton *Btnflag =[[UIButton alloc]initWithFrame:CGRectMake(Start_X+Width_Space*index, Star_Y+Heigt_Space*page, Button_Width, Button_Heigt)];
                    [Btnflag setTitle:PagLabeArry[i] forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(206, 206, 206, 1) forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(234, 58, 57, 0.5) forState:UIControlStateSelected];
                    [Btnflag.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
                    [Btnflag.titleLabel setTextAlignment:NSTextAlignmentLeft];
                    Btnflag.selected= NO;
                    Btnflag.tag = 1010+i;
                    //按钮点击方法
                    [Btnflag addTarget:self action:@selector(BtnflagClick:) forControlEvents:UIControlEventTouchUpInside];
                    [CellView_0 addSubview:Btnflag];
                }

                
            }
            CellView_0.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView_0;

        }
        else if (indexPath.section==2)
        {
            static NSString *CellID_1 = @"CellID_1";
            UITableViewCell *CellView_1 =[tableView dequeueReusableCellWithIdentifier:CellID_1];
            if (CellView_1 == nil)
            {
                
                CellView_1 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID_1];
                [CellView_1 setBackgroundColor:[UIColor clearColor]];
                //标签按钮循环创建
                int Start_X =0;
                int Star_Y =LRYScreenpH(10);
                int Button_Width =LRYScreenpW(100);
                int Button_Heigt =LRYScreenpH(30);
                int Width_Space =Button_Width+LRYScreenpW(20);
                int Heigt_Space =Button_Heigt+LRYScreenpH(20);
                for (int i = 0 ; i < 4; i++)
                {
                    //设置一行几个 几行
                    NSInteger index = i % 6;
                    NSInteger page = i / 6;
                    // 按钮
                    UIButton *Btnflag =[[UIButton alloc]initWithFrame:CGRectMake(Start_X+Width_Space*index, Star_Y+Heigt_Space*page, Button_Width, Button_Heigt)];
                    [Btnflag setTitle:DimenLabeArry[i] forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(206, 206, 206, 1) forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(234, 58, 57, 0.5) forState:UIControlStateSelected];
                    [Btnflag.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
                    [Btnflag.titleLabel setTextAlignment:NSTextAlignmentLeft];
                    Btnflag.selected= NO;
                    Btnflag.tag = 1030+i;
                    //按钮点击方法
                    [Btnflag addTarget:self action:@selector(BtnflagClick:) forControlEvents:UIControlEventTouchUpInside];
                    [CellView_1 addSubview:Btnflag];
                }

                
            }
            CellView_1.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView_1;

        }
        else
        {
            static NSString *CellID_2 = @"CellID_2";
            UITableViewCell *CellView_2 =[tableView dequeueReusableCellWithIdentifier:CellID_2];
            if (CellView_2 == nil)
            {
                
                CellView_2 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID_2];
                [CellView_2 setBackgroundColor:[UIColor clearColor]];
                //标签按钮循环创建
                int Start_X =0;
                int Star_Y =LRYScreenpH(10);
                int Button_Width =LRYScreenpW(100);
                int Button_Heigt =LRYScreenpH(30);
                int Width_Space =Button_Width+LRYScreenpW(20);
                int Heigt_Space =Button_Heigt+LRYScreenpH(20);
                for (int i = 0 ; i < 4; i++)
                {
                    //设置一行几个 几行
                    NSInteger index = i % 6;
                    NSInteger page = i / 6;
                    // 按钮
                    UIButton *Btnflag =[[UIButton alloc]initWithFrame:CGRectMake(Start_X+Width_Space*index, Star_Y+Heigt_Space*page, Button_Width, Button_Heigt)];
                    [Btnflag setTitle:BusLabeArry[i] forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(206, 206, 206, 1) forState:UIControlStateNormal];
                    [Btnflag setTitleColor:WYKColor(234, 58, 57, 0.5) forState:UIControlStateSelected];
                    [Btnflag.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
                    [Btnflag.titleLabel setTextAlignment:NSTextAlignmentLeft];
                    Btnflag.selected= NO;
                    Btnflag.tag = 1040+i;
                    //按钮点击方法
                    [Btnflag addTarget:self action:@selector(BtnflagClick:) forControlEvents:UIControlEventTouchUpInside];
                    [CellView_2 addSubview:Btnflag];
                }
                

                
            }
            CellView_2.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView_2;

            
        }
        
    }
    
    else
    {
        static NSString *CellID = @"CellID";
        HomeTableViewCell_1 *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            
            CellView =[[HomeTableViewCell_1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            [CellView setBackgroundColor:[UIColor clearColor]];
            
        }
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        CellView.delegate=self;
        CustomerMode *Customer=ArryCustomer[indexPath.row];
        [CellView setImageText:Customer.Headimagestr];
        [CellView setNameLabeText:Customer.Namestr DetailLabeText:Customer.Dateilstr DetailLabe1Text:Customer.Dateilstr1 DateLabeText:Customer.Datestr ComeSumLabeText:Customer.Comsumstr SupportLabeText:Customer.Supportstr];
        
        return CellView;
    }
}
//区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *tabarry =[[NSArray alloc]initWithObjects:@"行业标签筛选",@"维度筛选",@"参与企业",nil];
    if (tableView ==bgview)
    {
        return 0;
    } 
    else if(tableView == tableview1)
    {
        if (section ==0)
        {
            UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableview1.frame.size.width, LRYScreenpH(130))];
            [headview setBackgroundColor:[UIColor clearColor]];
            //设置横幅
            UIImageView *image =[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(0), LRYScreenpH(36), headview.frame.size.width, LRYScreenpH(75))];
            [image setImage:[UIImage imageNamed:@"hengfu@3x.png"]];
            [headview addSubview:image];
            return headview;
        }
        else
        {
            UILabel *labe =[[UILabel alloc]initWithFrame:CGRectMake(0, LRYScreenpH(20), tableview1.frame.size.width-LRYScreenpW(400), LRYScreenpH(30))];
            [labe setBackgroundColor:[UIColor clearColor]];
            [labe setTextColor:[UIColor blackColor]];
            [labe setText:tabarry[section-1]];
            [labe  setTextAlignment:NSTextAlignmentLeft];
            [labe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
            UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableview1.frame.size.width, LRYScreenpH(70))];
            [headview setBackgroundColor:[UIColor clearColor]];
            [headview addSubview:labe];
            
            
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(490), LRYScreenpH(20), LRYScreenpW(130), LRYScreenpH(30))];
            if ([Cellstates[section] boolValue]) {
                [btn setTitle:@"收起" forState:UIControlStateNormal];
            }
            else
            {
                 [btn setTitle:@"更多" forState:UIControlStateNormal];
            }
            [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
            [btn setTitleColor:WYKColor(255, 0, 0, 1) forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn addTarget:self action:@selector(MoreClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=section;
            [headview addSubview:btn];

            
            
            return headview;
        }
       
    }
    else
    {
        UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableview2.frame.size.width, LRYScreenpH(90))];
        [headview setBackgroundColor:[UIColor clearColor]];

        //搜索栏  观看博客后发现UISearchController能实现我所设想的动画效果，但是发现因为无法使用viewcontroller作罢，考虑用textfield手动实现，但考虑可能有层图问题，实践发现没有
        SearchBarTextField *SearchBar = [[SearchBarTextField alloc]initWithFrame:CGRectMake(0, 0, headview.frame.size.width, LRYScreenpH(60))];
        SearchBar.delegate=self;
        SearchBar.tag =1000;
        SearchBar.backgroundColor = [UIColor whiteColor];
        UIImageView *imageSearch = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(20), LRYScreenpH(15), LRYScreenpW(30),LRYScreenpH(30))];
        [imageSearch setImage:[UIImage imageNamed:@"icon_search"]];
        imageSearch.contentMode = UIViewContentModeScaleAspectFit;
        //SearchBar.borderStyle = UITextBorderStyleRoundedRect;  //圆角角度固定
        SearchBar.layer.cornerRadius = 15;
        SearchBar.layer.masksToBounds = YES;
        SearchBar.layer.borderColor =WYKColor(175, 175, 175, 1).CGColor;
        SearchBar.layer.borderWidth=1;
        SearchBar.placeholder = @"搜索";
        [SearchBar setValue:WYKColor(175, 175, 175, 1) forKeyPath:@"_placeholderLabel.textColor"];//颜色
        [SearchBar setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        SearchBar.textAlignment = NSTextAlignmentLeft;
         SearchBar.keyboardType = UIKeyboardTypeDefault;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchBarTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:SearchBar];
        [SearchBar addSubview:imageSearch];
        [headview addSubview:SearchBar];
        
   
        return headview;
    }
    
}
//区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView == bgview)
    {
        return 0;
    }
    else if (tableView == tableview1)
    {
        UIView *footview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableview1.frame.size.width, LRYScreenpH(1))];
        [footview setBackgroundColor:WYKColor(175, 175, 175, 1)];
        return footview;
    }
    else
    {
       UIView *footview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableview1.frame.size.width, LRYScreenpH(1))];
       [footview setBackgroundColor:[UIColor clearColor]];
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(520), LRYScreenpH(20), LRYScreenpW(130), LRYScreenpH(30))];
        btn.tag = BTNMORE;
        [btn setTitle:@"显示更多>" forState:UIControlStateNormal];
        [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn addTarget:self action:@selector(ShowMoreClick:) forControlEvents:UIControlEventTouchUpInside];
        [footview addSubview:btn];
        
        
        return footview;
        
    }
}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    
//    
//}


-(void)LeaveWordClick:(HomeTableViewCell_1 *)cell button:(UIButton *)sender
{
    
}

-(void)MoreClick:(UIButton *)sender
{
    //1.取出旧状态
    NSNumber *oldState = [Cellstates objectAtIndex:sender.tag];
    //2.创建新状态
     NSNumber *newState = [NSNumber numberWithDouble:![oldState boolValue]];
    //3.删除旧状态
    [Cellstates removeObjectAtIndex:sender.tag];
    //4.添加新状态
    [Cellstates insertObject:newState atIndex:sender.tag];
    //刷新表格
    [tableview1 reloadData];
    
    int n=0;
    for (int i=1; i<4; i++)
    {
        if ([Cellstates[i] boolValue]) {
            n++;
        }
    }
    HeightChange=LRYScreenpH(100)*n;
    [Listbgimage setFrame:CGRectMake(LRYScreenpW(40),LRYScreenpH(20),ScreenWidth-LRYScreenpW(80), LRYScreenpH(350)+HeightChange)];
    [tableview1 setFrame:CGRectMake(LRYScreenpW(80),LRYScreenpH(20),ScreenWidth-LRYScreenpW(160), Listbgimage.frame.size.height)];
    [tableview2 setFrame:CGRectMake(LRYScreenpW(40),Listbgimage.frame.origin.y+Listbgimage.frame.size.height+LRYScreenpH(30) , Listbgimage.frame.size.width,LRYScreenpH(800))];
    [tv2bgview setFrame:CGRectMake(tableview2.frame.origin.x, tableview2.frame.origin.y+LRYScreenpH(90), tableview2.frame.size.width, tableview2.frame.size.height-LRYScreenpH(90))];
    [bgview reloadData];
    
    
}


-(void)ShowMoreClick:(UIButton *)sender
{
    NSLog(@"  ");
    
}
-(void)BtnflagClick:(UIButton *)sender
{
    if (sender.selected == YES)
    {
        sender.selected=NO;

    }
    else
    {
        sender.selected=YES;
    }
}
//点击界面空白处退出
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SearchBarTextField *SearchBar = [self.view viewWithTag:1000];
    [SearchBar resignFirstResponder];
}
#pragma makr --UITextFieldDelegate
//UITextField的代理方法，点击键盘return按钮退出键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    SearchBarTextField *SearchBar = [self.view viewWithTag:1000];
    [SearchBar resignFirstResponder];
    return YES;
}

-(void)SearchBarTextFieldDidChange
{
    
}



-(void)hygetinfo
{
    /*
     1.创建参数字典
     2.导入apimanager，初始化
     3.请求数据
     4.观察返回成功的数据，建立jsonmodel:.h文件声明，.m文件实现
     5.处理数据：导入unitcell文件，接受字典元素
     */
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    ApiManager *manager =[ApiManager shareInstance];
    [manager POST_ResponsePath:@"gy/getHyInfo" params:params success:^(id result) {
        if ([result objectForKey:@"success"])
        {
            NSArray *data =[result objectForKey:@"data"];
            for (NSMutableDictionary *dict in data)
            {
             
                HYModel *model=[[HYModel alloc]initWithDictionary:dict error:nil];
                [self.hyArry addObject:model];
                
            }

            //在最后判断所有的接口是否都有数据了  有了的话就刷新表格
            NSLog(@"%@",self.hyArry);

        }
        else
        {
            
        }
    } failure:^(NSString *error) {
        
    }];
    
}


-(void)getWDInfo
{
//    NSMutableDictionary *params=[NSMutableDictionary dictionary];
//    ApiManager *manager =[ApiManager shareInstance];
//    [manager POST_ResponsePath:@"gy/getWdCfg" params:params success:^(id result) {
//        NSLog(@"%@",result);
//        if ([result objectForKey:@"success"]) {
//            <#statements#>
//        }
//    } failure:^(NSString *error) {
//        
//    }];
}
-(void)getQYInfo
{
    
}
-(void)getUserInfohName:(NSString *)hName wdName:(NSString *)wdName Company:(NSString *)Company key:(NSString *)key
{
    
    
    NSMutableDictionary *params =[NSMutableDictionary dictionaryWithObjectsAndKeys:hName,@"hName",wdName ,@"wdName",Company,@"Company",key,@"key",nil];
    ApiManager *manager=[ApiManager shareInstance];
    [manager POST_ResponsePath:@"gy/getUserInfo" params:params success:^(id result) {
        if ([result objectForKey:@"success"])
        {
            NSArray *data =[result objectForKey:@"data"];
            for (NSMutableDictionary *dict in data)
            {
                UserModel *model =[[UserModel alloc]initWithDictionary:dict error:nil];
                [self.userArry  addObject:model];
            }
            
            NSLog(@"%@",self.userArry);
        }
        else
        {
            
        }
        
    } failure:^(NSString *error) {
        
    }];
}

@end
