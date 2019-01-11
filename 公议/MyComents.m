//
//  MyComents.m
//  公议
//
//  Created by Mr.Lin on 17/12/23.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "MyComents.h"
#import "SizeHeader.h"

@interface MyComents ()<UITableViewDelegate,UITableViewDataSource>
{

    int leftSize;
    int rightSize;
}
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation MyComents

//_tableview只能在懒加载（）中实现  其他地方会出现死循环
//表格懒加载
-(UITableView *)tableview
{
    if (_tableview == nil)
    {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10)) style:UITableViewStylePlain];
        _tableview.backgroundColor=[UIColor whiteColor];
        _tableview.delegate =self;
        _tableview.dataSource=self;
        _tableview.estimatedRowHeight =100;//估计的高度
        _tableview.rowHeight = UITableViewAutomaticDimension;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}


-(instancetype)init
{
    self =[super init];
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
    [self setBTitleString:@"我的留言" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:[UIColor whiteColor]];
    [self setTitleBgcolor:[UIColor clearColor]];
    [self.view addSubview:self.tableview];
    
}


#pragma mark--------tableview相关函数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    
    if(indexPath.row == 0)
    {
//        NSArray * ImageArry = [[NSArray alloc]initWithObjects:@"A63A2EB89EE8DFE00BD3B56A4DC76D75.jpg",@"user@3x.png",@"scan_icon@3x.png",@"request_icon@3x.png",@"comment_icon@3x.png",@"collect_icon@3x.png",@"messege_icon@3x.png", nil];
//        NSArray * LabeArry = [[NSArray alloc]initWithObjects:@"Peppermint",@"达人榜",@"扫码评价",@"公议申请",@"我的评价",@"我的收藏",@"我的消息", nil];
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            CellView.backgroundColor = [UIColor whiteColor];
            //头像
            UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(17, 20, 50, 50)];
            head.tag = 1000;
            head.image = [UIImage imageNamed:@"photo_4"];
            head.layer.cornerRadius = CGRectGetWidth(head.frame)/2;
            head.layer.masksToBounds = YES;
            [CellView addSubview:head];
            
            leftSize = CGRectGetMaxX(head.frame)+20;
            
            //两个文本
            
            UIImageView *name = [self CreateLabelWithFrame:CGRectMake(leftSize, CGRectGetMinY(head.frame), 100, CGRectGetHeight(head.frame)/2-2.5) andTitle:@"sdasdas" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)] andTitleColor:[UIColor blackColor] andBgImage:nil];
            name.tag = 1001;
            [CellView addSubview:name];
            
            
            
            UIImageView *time = [self CreateLabelWithFrame:CGRectMake(leftSize, CGRectGetMinY(name.frame)+CGRectGetHeight(name.frame)+10, 160, 20) andTitle:@"2017-02-03 17:17:55" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)] andTitleColor:WYKColor(202,202,202,1.0) andBgImage:nil];
            time.tag = 1002;
            [CellView addSubview:time];
            
            
            UIButton *commentBtn = [self CreateButtonWithFrame:CGRectMake(ScreenWidth-40, CGRectGetMinY(head.frame)+CGRectGetHeight(head.frame)/2-10, 20, 20) andImage:[UIImage imageNamed:@"icon_reply.png"] andTitle:nil andTitleColor:nil andFont:nil andBgImage:nil];
            commentBtn.tag = 1003;
            [CellView addSubview:commentBtn];
            
            rightSize = ScreenWidth-CGRectGetMinX(commentBtn.frame);
            
            //内容
            UIImageView *content = [self CreateLabelWithFrame:CGRectMake(leftSize, CGRectGetMinY(time.frame)+CGRectGetHeight(time.frame)+20, ScreenWidth-leftSize-rightSize, 20) andTitle:@"asdasdasdasdasdasdsadas" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)] andTitleColor:[UIColor blackColor] andBgImage:nil];
            content.tag = 1004;
            [CellView addSubview:content];
            
            
        }
        UIImageView *head = [CellView viewWithTag:1000];
        UIImageView *name = [CellView viewWithTag:1001];
        UIImageView *time = [CellView viewWithTag:1002];
        UIImageView *content = [CellView viewWithTag:1004];
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        /*
         计算高度：
         拿到当前sention对应的数据内容：数组[indexpath.row]
         计算高度height
         content.frame = cgrectmake(x不变,y不变,width不变,height)
         */
        return CellView;
        
    }
   
    
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_two"];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_two"];
            cell.backgroundColor = [UIColor whiteColor];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize-rightSize, 40)];
            label.textColor = WYKColor(181,181,181,1);
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"张三丰:你最帅"];
            [string addAttribute:NSForegroundColorAttributeName value:WYKColor(253, 122, 88,1) range:NSMakeRange(0, 3+1)];
            label.attributedText = string;
            label.backgroundColor = WYKColor(245,245,245,1);
            [cell addSubview:label];
            
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        //计算高度
        
        /*
         计算高度：
         拿到当前sention对应的数据内容：数组[indexpath.row]
         计算高度height
         content.frame = cgrectmake(x不变,y不变,width不变,height)
         */
        return cell;

    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        /*
         先判断section：第几条数据的意思
         计算数据里面的内容高度height
         return height
         
         */
        return 120;
    }
    /*
     先判断section：第几条数据的意思
     计算数据里面的内容高度height
     return height
     
     */
    return 40;
}



-(void)btnAction:(UIButton *)btn
{
    
}



@end
