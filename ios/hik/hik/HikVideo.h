//
//  HikVideo.h
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
#import "PlayView.h"
#import "Mcu_sdk/PlayBackManager.h"
#import "Mcu_sdk/RealPlayManager.h"
#import "HikVideoControl.h"


@interface HikVideo :WXComponent<PlayBackManagerDelegate,RealPlayManagerDelegate>

@property (nonatomic,strong) HikVideoControl *vc;
@property (nonatomic, assign) BOOL     isLockScreen;
/** 是否是横屏状态 */
@property (nonatomic, assign) BOOL     isLandscape;
@property (nonatomic, assign) BOOL                   isFullScreen;
@end

