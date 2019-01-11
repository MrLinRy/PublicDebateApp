//
//  SideMenuViewController.m
//  公议
//
//  Created by Mr.Lin on 17/12/16.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "SideMenuViewController.h"
#import "ViewManger.h"
#import "SidetableCell.h"
#import "SearchBarTextField.h"
#import "HomeViewController.h"
#import "MyComents.h"
#import "MyJudgeVC.h"
#import "AppleViewController.h"
#import "MyCollectVC.h"
#import "MyNews.h"
#import "JDSideMenu.h"
@interface SideMenuViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    int flag;
}
@end


@implementation SideMenuViewController

-(instancetype)init
{
    self =[super init];
    if (self)
    {
        
        
//#pragma mark--------设置导航栏
//        [self setBBgColor:MainColor];
//        [self setBTitleString:@"扫码公议" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:  [UIColor whiteColor]];
//        [self setBBackButtonBgimage:[UIImage imageNamed:@"arrow_left@3x.png"]];
//        
    }
    return self;
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    //导航栏隐藏
    topbar.hidden = YES;
#pragma mark--------------电源栏字体颜色\背景图片
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    UIImageView *bgimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [bgimageview setImage:[UIImage imageNamed:@"background_home.png"]];
    [self.view addSubview:bgimageview];
    
    
#pragma mark-------------搜索栏
    
    //搜索栏  观看博客后发现UISearchController能实现我所设想的动画效果，但是发现因为无法使用viewcontroller作罢，考虑用textfield手动实现，但考虑可能有层图问题，实践发现没有
    SearchBarTextField *SearchBar = [[SearchBarTextField alloc]initWithFrame:CGRectMake(LRYScreenpW(20), LRYScreenpH(20), LRYScreenpW(430), LRYScreenpH(60))];
    SearchBar.delegate=self;
    SearchBar.tag =1000;
    SearchBar.backgroundColor = LRYUIColorFromRGB(0xffffff, 0.1);
    UIImageView *imageSearch = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(20), LRYScreenpH(15), LRYScreenpW(30),LRYScreenpH(30))];
    [imageSearch setImage:[UIImage imageNamed:@"搜索-2@2x.png"]];
    imageSearch.contentMode = UIViewContentModeScaleAspectFit;
    //SearchBar.borderStyle = UITextBorderStyleRoundedRect;  //圆角角度固定
    SearchBar.layer.cornerRadius = 12;
    SearchBar.layer.masksToBounds = YES;
    SearchBar.layer.borderColor =[UIColor whiteColor].CGColor;
    SearchBar.layer.borderWidth=0.1;
    SearchBar.placeholder = @"搜索";
    [SearchBar setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [SearchBar setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
    SearchBar.textAlignment = NSTextAlignmentLeft;
    SearchBar.keyboardType = UIKeyboardTypeDefault;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchBarTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:SearchBar];
    [SearchBar addSubview:imageSearch];
    [self.view addSubview:SearchBar];
    
    
    
    
    
    
    UITableView *tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, LRYScreenpH(100), ScreenWidth, LRYScreenpH(1200))];
    tableview.backgroundColor =[UIColor clearColor];
    tableview.scrollEnabled =NO;
    tableview.separatorStyle =UITableViewCellSeparatorStyleNone;
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    
    
}




#pragma mark--------tableview相关函数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * ImageArry = [[NSArray alloc]initWithObjects:@"A63A2EB89EE8DFE00BD3B56A4DC76D75.jpg",@"darenbang.png",@"scan_icon@3x.png",@"request_icon@3x.png",@"comment_icon@3x.png",@"collect_icon@3x.png",@"messege_icon@3x.png", nil];
    NSArray * LabeArry = [[NSArray alloc]initWithObjects:@"Peppermint",@"达人榜",@"扫码评价",@"公议申请",@"我的留言",@"我的收藏",@"我的消息", nil];
    static NSString *CellID = @"CellID";
    SidetableCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    if (CellView == nil)
    {
        CellView =[[SidetableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    CellView.selectionStyle=UITableViewCellSelectionStyleNone;
    [CellView setLabeText:LabeArry[indexPath.row]];
    [CellView setImageText:ImageArry[indexPath.row]];
    return CellView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LRYScreenpH(150);
}



//#pragma mark--------被选中的row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(indexPath.row == 0)
    {
        
    }
    else if(indexPath.row == 1)
    {
//        HomeViewController *Home =[[HomeViewController alloc]init];
//        SideMenuViewController *Side =[SideMenuViewController new];
//        JDSideMenu *menu =[[JDSideMenu alloc]initWithContentController:Home menuController:Side];
//        
//        
//        [[ViewManger ShareInstance].Navigationcontroler pushViewController:menu animated:NO];

        [[ViewManger ShareInstance].Navigationcontroler popToRootViewControllerAnimated:YES];
        
//        HomeViewController *HomeView=[[HomeViewController alloc]init];
//        [[ViewManger ShareInstance].Navigationcontroler pushViewController:HomeView animated: YES];
        
    }
    else if (indexPath.row == 2)
    {
        MyJudgeVC *MyJudge=[[MyJudgeVC alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:MyJudge animated:YES];
    }
    else if (indexPath.row ==3)
    {
        AppleViewController *AppleView =[[AppleViewController alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:AppleView animated:YES];
    }
    else if (indexPath.row ==4)
    {
        MyComents *MyComent=[[MyComents alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:MyComent animated:YES];
    }
    else if (indexPath.row ==5)
    {
        MyCollectVC *MyCollect =[[MyCollectVC alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:MyCollect animated:YES];
    }
    else
    {
        MyNews *MyNewsview =[[MyNews alloc]init];
        [[ViewManger ShareInstance].Navigationcontroler pushViewController:MyNewsview animated:YES];
    }
    
}


//#pragma mark--------未被选中的row
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    FirstTableViewCell *CellView  = [tableView cellForRowAtIndexPath:indexPath];
//    [CellView settextColor:WYKColor(37, 37, 37, 1.0) backgroundColor:[UIColor whiteColor]];
//
//}






-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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


//userTextField的监听方法
- (void)SearchBarTextFieldDidChange{
    
}


@end
