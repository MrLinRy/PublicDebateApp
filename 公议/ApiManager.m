//
//  ApiManager.m
//  AFNetWorking库初试
//
//  Created by Mr.Lin on 17/12/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ApiManager.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "SizeHeader.h"
static ApiManager *mInstance;

@implementation ApiManager
+ (ApiManager *)shareInstance {
    if (nil == mInstance) {
        mInstance = [[ApiManager alloc] init];
    }
    return mInstance;
}

- (void)POST_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params success:(void (^)(id))successHandler failure:(void (^)(NSString *))failureHandler {
    NSDictionary *paramters = [NSDictionary dictionaryWithObjectsAndKeys:params,@"param", nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 30;
    NSString *URL = [NSString stringWithFormat:@"%@%@",HeadUrl,responsePath];
    [manager POST:URL parameters:paramters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureHandler) {
            NSLog(@"%@",error);
            failureHandler([self errorToString:error]);
        }
    }];
}

- (void)GET_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params success:(void (^)(id))successHandler failure:(void (^)(NSError *))failureHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *URL = [NSString stringWithFormat:@"%@%@",HeadUrl,responsePath];
    [manager GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successHandler) {
            NSData *data = (NSData *)responseObject;
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            successHandler(obj[@"result"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureHandler) {
            failureHandler(error);
        }
    }];
}

//对后台返回错误进行解析
-(NSString *)errorToString:(NSError *)error {
    NSError *err;
    NSData *data = [[error userInfo] objectForKey:@"com.alamofire.serialization.response.error.data"];
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        NSLog(@"%@  %@",error, dic[@"error"]);
        return dic[@"error"];
    }
    return @"解析错误失败!";
}
@end
