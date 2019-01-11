//
//  BaseNetManager.h
//  testPhoto
//
//  Created by 林儒延 on 2017/8/7.
//  Copyright © 2017年 TuoRong. All rights reserved.
//

#import <Foundation/Foundation.h>

//http://121.196.192.233:8081
#define HOMEURL @"http://120.27.224.231:8081/"//正式
#define NETURL @"http://120.27.224.231:8081/" //测试
#define URL_PATH(url) [NETURL stringByAppendingString:url]
#define NETURL_PATH(url) [NETURL stringByAppendingString:url]

@interface BaseNetManager : NSObject

+ (void)GET:(NSString *)path parameters:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)POST:(NSString *)path parameters:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;





@end
