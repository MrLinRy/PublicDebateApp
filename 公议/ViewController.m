//
//  ViewController.m
//  公议
//
//  Created by Mr.Lin on 17/12/16.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "BaseNetManager.h"
#import "UnitCell.h"

@interface ViewController ()
{
    NSMutableArray * dataArray;
}
@end

@implementation ViewController

-(instancetype)init
{
    self =[super init];
    if (self)
    {
        
        
#pragma mark--------设置导航栏
        [self setBBgColor:MainColor];
        [self setBTitleString:@"扫码公议" andFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)] andColor:  [UIColor blackColor]];
        [self setBBackButtonBgimage:[UIImage imageNamed:@"arrow_left@3x.png"]];
        
        
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    
#pragma mark--------------解析数据
    dataArray = [NSMutableArray array];
    //    NSString * userInfoString = @"http://120.27.224.231:8081/easylearn/api/subject/getRegionList";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //http://120.27.224.231:8081/easylearn/api/subject/getRegionList
    [BaseNetManager POST:NETURL_PATH(@"easylearn/api/subject/getRegionList") parameters:params success:^(id responseObject) {
        //json ---->二进制串
        id responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        SuccessModel *success = [[SuccessModel alloc]initWithDictionary:responseData error:NULL];
        
        //相当于
        //        SuccessModel * model = [[SuccessModel alloc] init];
        //        model.code = [responseData objectForKey:@"code"];
        //        model.data = [responseData objectForKey:@"data"];
        
        if ([success.code isEqualToString:@"success"])
        {
            NSArray *arr = [success.data objectForKey:@"provList"];
            for (NSDictionary *dic in arr)
            {
                ProvinceModel *province = [[ProvinceModel alloc]initWithDictionary:dic error:nil];
                
                // SuccessModel * model = [[SuccessModel alloc] init];
                //        model.code = [responseData objectForKey:@"code"];
                //        model.data = [responseData objectForKey:@"data"];
                
                [dataArray addObject:province];
            }
            
            
            NSLog(@"%@",dataArray);
        }
        
        ProvinceModel *mode = dataArray[0];
        NSLog(@"%@",mode.name);
        
        //        字典  两个元素： code：标示位
        //                       data  字典：第一个元素为数组
        //        if ([[responseData objectForKey:@"code"] isEqualToString:@"success"])
        //        {
        //            NSArray *arr = [[responseData objectForKey:@"data"] objectForKey:@"provList"];
        //
        //            if (arr.count != 0)
        //            {
        //                for (NSDictionary *dic in arr)
        //                {
        //                    NSLog(@"%@",dic);
        //                }
        //
        //
        //
        //
        //
        //
        //            }
        //        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
