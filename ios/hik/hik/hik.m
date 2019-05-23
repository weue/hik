//
//  hik.m
//  hik
//
//  Created by 郑江荣 on 2019/4/5.
//  Copyright © 2019 郑江荣. All rights reserved.
//

#import "hik.h"
#import "Mcu_sdk/MCUVmsNetSDK.h"
#import "Mcu_sdk/VideoPlaySDK.h"
#import <WeexSDK/WXSDKInstance.h>
#import <WeexSDK/WXSDKEngine.h>
#import "farwolf_weex.h"
@implementation hik
WX_PLUGIN_Entry(hik)

-(void)initEntry:(NSMutableDictionary*)lanchOption
{
    //初始化SDK
    VP_InitSDK();
    //设置是否开启取流日志打印，默认不开启
    VP_SetPrint(NO);
}

@end
