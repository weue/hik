//
//  NormalDefine.h
//  HikSmartBuild
//
//  Created by apple on 15-3-10.
//  Copyright (c) 2015年 HikVision. All rights reserved.
//

#ifndef HikSmartBuild_NormalDefine_h
#define HikSmartBuild_NormalDefine_h

static NSTimeInterval const delayTime = 2.5;

//http地址
#define HTTPADDRESS @"msp/mobile"

//背景色
#define backGroundColor [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0]
/**
 *  字体大小
 */
#define SIZE10 10.0f
#define SIZE11 11.0f
#define SIZE12 12.0f
#define SIZE13 13.0f
#define SIZE14 14.0f
#define SIZE15 15.0f
#define SIZE17 17.0f
#define SIZE18 18.0f
#define SIZE20 20.0f
#define SIZE25 25.0f

#define CELL_LEFTDISTANCE 20.0f//tableview中图片离左边的距离
//tableview中分割线的颜色
#define CELL_SEPARATOR_COLOR COLOR(240.0f,240.0f,240.0f,1.0f)
#define TABLE_SEPARATOR_COLOR COLOR(230.0f,230.0f,230.0f,1.0f)
//cell左边图片的大小
#define CELL_IMAGE_WIDTH 37
#define CELL_IMAGE_HEIGHT 37

#define CELL_DEFAULT_HEIGHT 44.0f//默认cell的高度
#define MINHEIGHT 0.0001f//tableview的header和footer高度设为0

#pragma mark --屏幕长宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH_SCALE SCREEN_WIDTH/320.0
#define SCREEN_HEIGHT_SCALE SCREEN_HEIGHT/568.0

#define CONTROLLER_VIEW_WIDTH self.view.frame.size.width
#define CONTROLLER_VIEW_HEIGHT self.view.frame.size.height

//判断iphone类型
#define IPHONE4 ([UIScreen mainScreen].bounds.size.height<568)
#define IPHONE5 ([UIScreen mainScreen].bounds.size.height==568)
#define IPHONE6 ([UIScreen mainScreen].bounds.size.height==667)
#define IPHONE6P ([UIScreen mainScreen].bounds.size.height==736)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//获取当前系统的版本号
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion]floatValue]


//获取当前语言
#define CurrentLanguaeg [[NSLocale preferredLanguages] objectAtIndex:0]

//16进制颜色转换成rgb
#define UICOLORTORGB(rgbValue) [UIColor colorWithRed:((float)((strtol([rgbValue UTF8String], 0, 16) & 0xFF0000) >> 16))/255.0 green:((float)((strtol([rgbValue UTF8String], 0, 16) & 0xFF00) >> 8))/255.0 blue:((float)(strtol([rgbValue UTF8String], 0, 16) & 0xFF))/255.0 alpha:1.0]
//rgb颜色设置
#define COLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//本地化
#define MyLocal(x) NSLocalizedString(x,nil)

#pragma mark --登录及地址界面
#define MSP_ADDRESS     @"MSP_8710_Address"
#define MSP_PORT        @"MSP_871_Port"
#define MSP_USERNAME    @"MSP_871_username"
#define MSP_PASSWORD    @"MSP_871_password"
#define DEFAULT_MSP_PORT @"443"
#define PUSH_SERVER_ADDRESS @"60.191.22.218"
#define PUSH_SERVER_PORT @"8443"
//手势密码key
#define CORELOCKKEY [NSString stringWithFormat:@"CoreLockPWDKey %@%@",[[NSUserDefaults standardUserDefaults] objectForKey:MSP_USERNAME],[[NSUserDefaults standardUserDefaults] objectForKey:MSP_ADDRESS]]
#define LOCKPWD_WRONG_COUNT @"wrongCount"

#pragma mark --视频界面
#define VIDEOVIEW_PORTRAIT_TOOLBAR_HEIGHT        48 // 预览/回放界面，竖屏时工具栏高度
#define VIDEOVIEW_HORIZONTAL_TOOLBAR_HEIGHT      44 // 横屏时工具栏高度

#define VIDEOVIEW_PORTRAIT_PANEL_HEIGHT          74 // 预览/回放界面，竖屏时panelView高度
#define VIDEOVIEW_HORIZONTAL_PANEL_WIDTH         44 // 横屏时panelView高度

#define VIDEOVIEW_BACKGROUNDCOLOR [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0]

// 偏差定义为9像素
#define kMaxVariance        9
// 轻扫事件最大时间间隔
#define kMaxSwipeInterval   0.2f
// 轻扫自动停止时间间隔
#define kAutoStopInterval   0.5f
// 捏合展开操作自动停止时间
#define kMaxDelayInterval   1.0f


#pragma mark --视频资源
#define CELL_DOWNPANEL_BACKGROUNDCOLOR COLOR(181.0f,181.0f,181.0f,1.0f)

//云台控制
#define PTZ_COMMAND_ZOOM_IN             11      //焦距增大
#define PTZ_COMMAND_ZOOM_OUT            12      //焦距减小
#define PTZ_COMMAND_FOCUS_NEAR          13      //聚焦增大
#define PTZ_COMMAND_FOCUS_FAR           14      //聚焦减小
#define PTZ_COMMAND_IRIS_OPEN           15      //光圈增大
#define PTZ_COMMAND_IRIS_CLOSE          16      //光圈减小

#define PTZ_COMMAND_TILT_UP             21
#define PTZ_COMMAND_TILT_DOWN           22
#define PTZ_COMMAND_PAN_LEFT            23
#define PTZ_COMMAND_PAN_RIGHT           24
#define PTZ_COMMAND_UP_LEFT             25
#define PTZ_COMMAND_UP_RIGHT            26
#define PTZ_COMMAND_DOWN_LEFT           27
#define PTZ_COMMAND_DOWN_RIGHT          28

#define PTZ_COMMAND_PRESET_SET          8       //设置预置点
#define PTZ_COMMAND_PRESET_CLEAN        9       //清除预置点
#define PTZ_COMMAND_PRESET_GOTO         39      //调用预置点

//清晰度
#define VIDEO_QUALITY_FLUENCY           2       //流畅
#define VIDEO_QUALITY_CLEAR             1       //标清
#define VIDEO_QUALITY_HIGHDEFINITION    0       //高清

//每页返回的数量
#define NUM_PER_PAGE 10

//textField允许输入的最大长度
#define ALLOWMAXLENGTH 32

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
#define kNotificationCenter ([NSNotificationCenter defaultCenter])
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil] show]
#endif
