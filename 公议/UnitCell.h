//
//  UnitCell.h
//  AF-networking集成
//
//  Created by 陈剑英 on 2017/12/8.
//  Copyright © 2017年 陈冬芹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UnitCell : NSObject

@end



@interface SuccessModel:JSONModel


@property(nonatomic,strong)NSString <Optional>*code;
@property(nonatomic,strong)NSDictionary <Optional>*data;

@end

@interface ProvinceModel:JSONModel

@property(nonatomic,strong)NSString <Optional>*code;
@property(nonatomic,strong)NSString <Optional>*name;
@property(nonatomic,strong)NSString <Optional>*parent_code;

@end















