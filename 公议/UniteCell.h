//
//  UniteCell.h
//  公议
//
//  Created by Mr.Lin on 18/1/6.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"



@interface UniteCell : NSObject

@end


@interface HYModel :JSONModel
@property (nonatomic,strong) NSString <Optional>*hid;
@property(nonatomic,strong)NSString <Optional> *name;
@property(nonatomic,strong)NSString <Optional> *type;
@end

@interface UserModel :JSONModel
@property (nonatomic,strong) NSString <Optional>*company;
@property(nonatomic,strong)NSString <Optional> *create_time;
@property(nonatomic,strong)NSString <Optional> *fw_type;
@property(nonatomic,strong)NSString <Optional> *head_url;
@property(nonatomic,strong)NSArray <Optional> *img;
@property(nonatomic,strong)NSString <Optional> *is_favor;
@property(nonatomic,strong)NSString <Optional> *name;
@property(nonatomic,strong)NSString <Optional> *nickname;
@property(nonatomic,strong)NSString <Optional> *phone;
@property(nonatomic,strong)NSString <Optional> *serviceDes;
@property(nonatomic,strong)NSString <Optional> *sex;
@property(nonatomic,strong)NSString <Optional> *spNums;
@property(nonatomic,strong)NSString <Optional> *support;
@property(nonatomic,strong)NSString <Optional> *uid;
@end