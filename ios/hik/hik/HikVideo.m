//
//  HikVideo.m
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import "HikVideo.h"
#import "farwolf.h"
#import <WeexPluginLoader/WeexPluginLoader.h>




WX_PlUGIN_EXPORT_COMPONENT(hikvideo, HikVideo)


@implementation HikVideo
WX_EXPORT_METHOD(@selector(play:callback:))
WX_EXPORT_METHOD(@selector(updatePlayBack:callback:timeCallback:))
WX_EXPORT_METHOD(@selector(control:))
WX_EXPORT_METHOD(@selector(audio:))
WX_EXPORT_METHOD(@selector(enableZoom:))
//WX_EXPORT_METHOD(@selector(stop))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(capture:callback:))
WX_EXPORT_METHOD(@selector(startRecord:))
WX_EXPORT_METHOD(@selector(stopRecord:))
WX_EXPORT_METHOD(@selector(enterFullScreen))




-(UIView*)loadView{
 
    return [UIView new];
}

-(void)viewDidLoad
{
    HikVideoControl *vc=[HikVideoControl new];
    [self.view addSubview:vc.view];
    __weak typeof (self)weakself=self;
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view);
    }];
    vc.parent=self.view;
    [self.weexInstance.viewController addChildViewController:vc];
    self.vc=vc;
}

-(void)realPlay:(NSMutableDictionary*)param callback:(WXModuleCallback)callback{
    [self.vc realPlay:param callback:callback];
}


-(void)playBack:(NSMutableDictionary*)param  callback:(WXModuleCallback)callback{
  [self.vc playBack:param callback:callback];
    
}


-(void)play:(NSMutableDictionary*)param callback:(WXModuleCallback)callback{
    NSString *type=param[@"type"];
    if([@"real" isEqualToString:type]){
        [self realPlay:param callback:callback];
    }else{
        [self playBack:param callback:callback];
    }
}

-(void)updatePlayBack:(NSMutableDictionary*)param  callback:(WXModuleKeepAliveCallback)callback timeCallback:(WXModuleKeepAliveCallback)timeCallback{
    
    [self.vc updatePlayBack:param callback:callback timeCallback:timeCallback];
 
}



-(void)control:(NSMutableDictionary*)param{
    [self.vc operate:param];
}

-(int)audio:(BOOL)audio{
    [self.vc audio:audio];
}

-(int)enableZoom:(BOOL)zoom{
    [self.vc enableZoom:zoom];
}

-(void)enterFullScreen{
    self.vc.isFullScreen=!self.vc.isFullScreen;
    [self.vc enterFullScreen:self.vc.isFullScreen];
}

-(void)stop{
 [self.vc stop];
}

-(void)pause:(BOOL)pause{
    [self.vc pause:pause];
}

- (void)capture:(WXModuleCallback)callback{
    NSString *path= [self.vc capture:100];
    if(path!=nil)
    callback(@{@"path":path});
}

-(void)startRecord:(WXModuleCallback)callback{
    int code=   [self.vc startRecord];
    callback(@{@"code":@(code)});
}

-(void)stopRecord:(WXModuleCallback)callback{
    NSString *path=  [self.vc stopRecord];
    callback(@{@"path":path});
}

- (void)realPlayCallBack:(PLAY_STATE)playState realManager:(RealPlayManager *)realPlayManager{
    
}



@end
