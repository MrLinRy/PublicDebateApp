//
//  AppleViewController.m
//  公议
//
//  Created by Mr.Lin on 17/12/29.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "AppleViewController.h"
#import "ViewManger.h"
#import "SizeHeader.h"
#import "AddFlagView.h"
@interface AppleViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int leftSize;
    int rightSize;

}
@property (nonatomic,strong) UITableView *tableView;


@end



@implementation AppleViewController



-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight =LRYScreenpH(100);
        _tableView.rowHeight=UITableViewAutomaticDimension;
        [_tableView setBackgroundColor:WYKColor(247, 247, 247, 1)];
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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_home.png"]]];
    [self setBBgColor:[UIColor clearColor]];
    [self setBTitleString:@"我的留言" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:[UIColor whiteColor]];
    [self setTitleBgcolor:[UIColor clearColor]];
    [self.view addSubview:self.tableView];

    leftSize =LRYScreenpW(40);
    rightSize =leftSize;
    
}


#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 2;
    }
    else if (section == 2)
    {
        return 6;
    }
    else
    {
        return 1;
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
    
    if (section == 2)
    {
        UIView *footView =[[UIView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight-LRYScreenpH(108))];
        [footView setBackgroundColor:[UIColor clearColor]];
        UIButton *btn=[self CreateButtonWithFrame:CGRectMake(leftSize*2, LRYScreenpH(30), ScreenWidth-leftSize*4, LRYScreenpH(140)-LRYScreenpH(60)) andImage:nil andTitle:@"提交审核" andTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)] andBgImage:nil];
        [btn setBackgroundColor:WYKColor(234, 58, 57, 1)];
        [btn addTarget:self action:@selector(AppleClick) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:btn];
        return footView;
    }
    else
    {
       UIView *footView =[[UIView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, LRYScreenpH(20))];
        [footView setBackgroundColor:[UIColor clearColor]];
        return footView;
    }
}
#pragma mark-------区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if (section == 2)
    {
        return LRYScreenpH(140);
    }
    else
    {
        return LRYScreenpH(20);
    }

}

#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            [CellView setBackgroundColor:[UIColor clearColor]];
            UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize*2, LRYScreenpH(341))];
            [bgview setBackgroundColor:[UIColor whiteColor]];
            [bgview.layer setMasksToBounds:YES];
            [bgview.layer setBorderWidth:0.5];
            [bgview.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
            //头标题
            UIImageView *labHead=[self CreateLabelWithFrame:CGRectMake(leftSize/2,LRYScreenpH(30) , CGRectGetWidth(bgview.frame)-leftSize, LRYScreenpH(30)) andTitle:@"以下是受评人的信息登记，应有别于用户注册." andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)] andTitleColor:[UIColor blackColor] andBgImage:nil];
            [bgview addSubview:labHead];
           
            /*
             //上传图片按钮背景
            UIView *bgviewimage1 =[[UIView alloc]initWithFrame:CGRectMake(leftSize, CGRectGetMaxY(labHead.frame)+LRYScreenpH(30), CGRectGetWidth(bgview.frame)/2-LRYScreenpW(50), CGRectGetHeight(bgview.frame)-CGRectGetMaxY(labHead.frame)-LRYScreenpH(60))];
            [bgviewimage1 setBackgroundColor:WYKColor(242, 242, 242, 1)];
            CAShapeLayer *borderLayer = [CAShapeLayer layer];
            borderLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(bgviewimage1.frame), CGRectGetHeight(bgviewimage1.frame));
            borderLayer.position = CGPointMake(CGRectGetMidX(bgviewimage1.bounds), CGRectGetMidY(bgviewimage1.bounds));
            //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
            borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
            borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
            //虚线边框
            borderLayer.lineDashPattern = @[@2, @2];
            //实线边框
            //    borderLayer.lineDashPattern = nil;
            borderLayer.fillColor = [UIColor clearColor].CGColor;
            borderLayer.strokeColor = WYKColor(175, 175, 175, 1).CGColor;
            [bgviewimage1.layer addSublayer:borderLayer];
            [bgview addSubview:bgviewimage1];
            
            UIView *bgviewimage2 =[[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bgviewimage1.frame)+LRYScreenpW(20), CGRectGetMaxY(labHead.frame)+LRYScreenpH(30), CGRectGetWidth(bgview.frame)/2-LRYScreenpW(50), CGRectGetHeight(bgview.frame)-CGRectGetMaxY(labHead.frame)-LRYScreenpH(60))];
            [bgviewimage2 setBackgroundColor:WYKColor(242, 242, 242, 1)];
            CAShapeLayer *borderLayer2 = [CAShapeLayer layer];
            borderLayer2.bounds = CGRectMake(0, 0, CGRectGetWidth(bgviewimage1.frame), CGRectGetHeight(bgviewimage1.frame));
            borderLayer2.position = CGPointMake(CGRectGetMidX(bgviewimage1.bounds), CGRectGetMidY(bgviewimage1.bounds));
            //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
            borderLayer2.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer2.bounds cornerRadius:0].CGPath;
            borderLayer2.lineWidth = 1. / [[UIScreen mainScreen] scale];
            //虚线边框
            borderLayer2.lineDashPattern = @[@2, @2];
            //实线边框
            //    borderLayer2.lineDashPattern = nil;
            borderLayer2.fillColor = [UIColor clearColor].CGColor;
            borderLayer2.strokeColor = WYKColor(175, 175, 175, 1).CGColor;
            [bgviewimage2.layer addSublayer:borderLayer2];
            [bgview addSubview:bgviewimage2];
             */
            //上传图片按钮
            UIButton *image1btn =[self CreateButtonWithFrame:CGRectMake(leftSize, CGRectGetMaxY(labHead.frame)+LRYScreenpH(30), CGRectGetWidth(bgview.frame)/2-LRYScreenpW(50), CGRectGetHeight(bgview.frame)-CGRectGetMaxY(labHead.frame)-LRYScreenpH(60)) andImage:[UIImage imageNamed:@"btn_up_img1.png"] andTitle:nil andTitleColor:nil andFont:nil andBgImage:nil];
            [image1btn addTarget:self action:@selector(UploadClick:) forControlEvents:UIControlEventTouchUpInside];
            UIButton *image2btn =[self CreateButtonWithFrame:CGRectMake(CGRectGetMaxX(image1btn.frame)+LRYScreenpW(20), CGRectGetMaxY(labHead.frame)+LRYScreenpH(30), CGRectGetWidth(bgview.frame)/2-LRYScreenpW(50), CGRectGetHeight(bgview.frame)-CGRectGetMaxY(labHead.frame)-LRYScreenpH(60)) andImage:[UIImage imageNamed:@"btn_up_img2.png"] andTitle:nil andTitleColor:nil andFont:nil andBgImage:nil];
            [image2btn addTarget:self action:@selector(UploadClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgview addSubview:image1btn];
            [bgview addSubview:image2btn];
            
            
            
            
            [CellView addSubview:bgview];

        }
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        return CellView;

    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row ==0)
        {
            
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                
                //背景
                UIView *headView =[[UIView alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize-rightSize, LRYScreenpH(70))];
                [headView setBackgroundColor:[UIColor whiteColor]];
                [headView.layer setMasksToBounds:YES];
                [headView.layer setBorderWidth:0.5];
                [headView.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
                
                UIImageView *Labe=[self CreateLabelWithFrame:CGRectMake(LRYScreenpW(20), LRYScreenpH(20), LRYScreenpW(220), LRYScreenpH(30)) andTitle:@"行业标签选择:" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)] andTitleColor:WYKColor(175, 175, 175, 1)  andBgImage:nil];
                [headView addSubview:Labe];
                
                [CellView addSubview:headView];
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView;
        }
        else
        {
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                //背景
                UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize*2, LRYScreenpH(114))];
                [bgview setBackgroundColor:[UIColor whiteColor]];
                [bgview.layer setMasksToBounds:YES];
                [bgview.layer setBorderWidth:0.5];
                [bgview.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
                
                //标签按钮循环创建
                int Start_X =LRYScreenpW(20);
                int Star_Y =LRYScreenpH(30);
                int Button_Width =LRYScreenpW(116);
                int Button_Heigt =LRYScreenpH(54);
                int Width_Space =Button_Width+LRYScreenpW(15);
                int Heigt_Space =Button_Heigt+LRYScreenpH(30);
                
                NSArray *Arryflag=[NSArray arrayWithObjects:@"中餐",@"西餐",@"快餐",@"连锁",@"添加" ,nil];
                for (int i = 0 ; i < 5; i++)
                {
                    //设置一行几个 几行
                    NSInteger index = i % 3;
                    NSInteger page = i / 3;
                    // 按钮
                    UIButton *Btnflag = [self CreateButtonWithFrame:CGRectMake(Start_X+Width_Space*i, Star_Y, Button_Width, Button_Heigt) andImage:nil andTitle:Arryflag[i] andTitleColor:WYKColor(234, 58, 57, 1) andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)] andBgImage:nil];
                    [Btnflag setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                    Btnflag.selected= NO;
                    Btnflag.tag = 1000+i;
                    [Btnflag.layer setMasksToBounds:YES];
                    [Btnflag.layer setCornerRadius:CGRectGetWidth(Btnflag.frame)/4];
                    [Btnflag.layer setBorderWidth:1];
                    [Btnflag.layer setBorderColor:WYKColor(234, 58, 57, 1).CGColor];
                    
                    if (i == 4)
                    {
                        [Btnflag setBackgroundColor:WYKColor(234, 58, 57, 1)];
                        [Btnflag setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    }
                    
                    //按钮点击方法
                    [Btnflag addTarget:self action:@selector(BtnflagClick:) forControlEvents:UIControlEventTouchUpInside];
                    [bgview addSubview:Btnflag];
                }
                
                
                
                [CellView addSubview:bgview];
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView;
        }
        

    }
    else
    {
        NSArray *Arryflag=[NSArray arrayWithObjects:@"姓名：",@"性别：",@"手机：",@"服务单位：",@"昵称：" ,@"服务宣言：" ,nil];
        if (indexPath.row == 3|| indexPath.row ==5)
        {
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                //背景
                UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize*2, LRYScreenpH(91))];
                [bgview setBackgroundColor:[UIColor whiteColor]];
                [bgview.layer setMasksToBounds:YES];
                [bgview.layer setBorderWidth:0.5];
                [bgview.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
                
                UIImageView *lab =[self CreateLabelWithFrame:CGRectMake(leftSize, LRYScreenpH(30), LRYScreenpW(140), LRYScreenpH(30)) andTitle:Arryflag[indexPath.row] andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)] andTitleColor:[UIColor blackColor] andBgImage:nil];
                [bgview addSubview:lab];
                
                //输入框
                UITextField *textfield =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lab.frame), CGRectGetMinY(lab.frame), CGRectGetWidth(bgview.frame)-(leftSize*2)-CGRectGetHeight(lab.frame),CGRectGetHeight(lab.frame))];
                [textfield setTextColor:[UIColor blackColor]];
                textfield.delegate=self;
                textfield.tag =10000+indexPath.row;
                textfield.backgroundColor = [UIColor whiteColor];
                [textfield setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
                textfield.textAlignment = NSTextAlignmentLeft;
                textfield.keyboardType = UIKeyboardTypeDefault;
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchBarTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:textfield];
                [bgview addSubview:textfield];
                
                
                
                [CellView addSubview:bgview];
                
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView;

        }
        else
        {
            static NSString *CellID = @"CellID";
            UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
            if (CellView == nil)
            {
                CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
                [CellView setBackgroundColor:[UIColor clearColor]];
                //背景
                UIView *bgview=[[UIView alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize*2, LRYScreenpH(91))];
                [bgview setBackgroundColor:[UIColor whiteColor]];
                [bgview.layer setMasksToBounds:YES];
                [bgview.layer setBorderWidth:0.5];
                [bgview.layer setBorderColor:WYKColor(175, 175, 175, 0.5).CGColor];
                
                UIImageView *lab =[self CreateLabelWithFrame:CGRectMake(leftSize, LRYScreenpH(30), LRYScreenpW(90), LRYScreenpH(30)) andTitle:Arryflag[indexPath.row] andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)] andTitleColor:[UIColor blackColor] andBgImage:nil];
                [bgview addSubview:lab];
                
                
                //输入框
                UITextField *textfield =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lab.frame), CGRectGetMinY(lab.frame), CGRectGetWidth(bgview.frame)-(leftSize*2)-CGRectGetHeight(lab.frame),CGRectGetHeight(lab.frame))];
                [textfield setTextColor:[UIColor blackColor]];
                textfield.delegate=self;
                textfield.tag =10000+indexPath.row;
                textfield.backgroundColor = [UIColor whiteColor];
                [textfield setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
                textfield.textAlignment = NSTextAlignmentLeft;
                textfield.keyboardType = UIKeyboardTypeDefault;
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SearchBarTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:textfield];
                [bgview addSubview:textfield];
                

                
                
                
                [CellView addSubview:bgview];
                
            }
            CellView.selectionStyle=UITableViewCellSelectionStyleNone;
            return CellView;

        }
    }
    
}

#pragma mark-------行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return LRYScreenpH(341);
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return LRYScreenpH(70);
        }
        else
        {
             return LRYScreenpH(114);

        }
    }
    else
    {
        return LRYScreenpH(91);
    }
}


-(void)AppleClick
{
    [[ViewManger ShareInstance].Navigationcontroler popViewControllerAnimated:YES];
}
-(void)UploadClick:(UIButton *)sender
{
    
    
}
-(void)BtnflagClick:(UIButton *)sender
{
    UIButton *btn =[self.view viewWithTag:sender.tag];

    if (sender.tag == 1004)
    {
        AddFlagView *FlagView=[[AddFlagView alloc]init];
        [self.view addSubview:FlagView];
    }
    else
    {
        if (btn.selected ==NO)
        {
            btn.selected =YES;
            [btn setBackgroundColor:WYKColor(234, 58, 57, 1)];
        }
        else
        {
            btn.selected =NO;
            [btn setBackgroundColor:[UIColor whiteColor]];
            
        }
        

    }
}
-(void)SearchBarTextFieldDidChange
{
    
}
//点击界面空白处退出
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITextField *textfield = [self.view viewWithTag:10000];
    [textfield resignFirstResponder];
}
#pragma makr --UITextFieldDelegate
//UITextField的代理方法，点击键盘return按钮退出键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    UITextField *textfield = [self.view viewWithTag:10000];
    [textfield resignFirstResponder];
    return YES;
}

@end
