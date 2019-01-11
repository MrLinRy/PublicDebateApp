//
//  ViewManger.h
//  10.21
//
//  Created by Mr.Lin on 17/10/21.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ViewManger : NSObject
{
    @private
    UINavigationController * _navigationcontroler;
}
@property (strong,readonly) UINavigationController * Navigationcontroler;
+(instancetype)ShareInstance;


@end
