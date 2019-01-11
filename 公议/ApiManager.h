//
//  ApiManager.h
//  AFNetWorking库初试
//
//  Created by Mr.Lin on 17/12/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject

+ (ApiManager *)shareInstance;

- (void)POST_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params success:(void (^)(id result))successHandler failure:(void (^)(NSString *error))failureHandler;

- (void)GET_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params success:(void (^)(id result))successHandler failure:(void (^)(NSError *error))failureHandler;

@end
