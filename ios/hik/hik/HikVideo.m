//
//  HikVideo.m
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import "HikVideo.h"
#import "farwolf.h"
#import "farwolf_weex.h"
#import <WeexPluginLoader/WeexPluginLoader.h>




WX_PlUGIN_EXPORT_COMPONENT(hikvideo, HikVideo)


@implementation HikVideo
WX_EXPORT_METHOD(@selector(play:callback:))
WX_EXPORT_METHOD(@selector(updatePlayBack:callback:timeCallback:))
WX_EXPORT_METHOD(@selector(control:))
WX_EXPORT_METHOD(@selector(audio:))
WX_EXPORT_METHOD(@selector(enableZoom:))
WX_EXPORT_METHOD(@selector(stop))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(capture:))
WX_EXPORT_METHOD(@selector(startRecord:))
WX_EXPORT_METHOD(@selector(stopRecord:callback:))
WX_EXPORT_METHOD(@selector(enterFullScreen))
WX_EXPORT_METHOD(@selector(getPlayTime:))
WX_EXPORT_METHOD(@selector(getPlayState:))
WX_EXPORT_METHOD(@selector(queryRecordInfo:callback:))





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
    vc.controller=self;
    [self.weexInstance.viewController addChildViewController:vc];
    self.vc=vc;
}

-(void)getPlayState:(WXModuleCallback)callback{
    callback(@{@"state":@(self.vc.playState)});
}

-(void)realPlay:(NSMutableDictionary*)param callback:(WXModuleCallback)callback{
    [self.vc realPlay:param callback:callback];
}


-(void)playBack:(NSMutableDictionary*)param  callback:(WXModuleCallback)callback{
  [self.vc playBack:param callback:callback];
    
}

-(void)queryRecordInfo:(NSMutableDictionary*)param callback:(WXModuleCallback)callback{
    [self.vc queryRecordInfo:param callback:callback];
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

//视频截图，成功返回code为1，失败为0
- (void)capture:(WXModuleCallback)callback{
    NSString *path= [self.vc capture:100];
    if(path){
        callback(@{@"path":path,@"code":@1});
    } else {
        callback(@{@"code":@0});
    }
}

-(void)startRecord:(WXModuleCallback)callback{
    int code=   [self.vc startRecord];
    if(callback)
    callback(@{@"code":@(code)});
}

-(void)stopRecord:(NSMutableDictionary*)param callback: (WXModuleCallback)callback{
    NSString *path=  [self.vc stopRecord];
    bool saveToGallery= [[param valueForKey:@"save"] boolValue];
    callback(@{@"path":path});
    if(saveToGallery){
        NSString *px=[path replace:PREFIX_SDCARD withString:@""];
        px=[px replace:@"file://" withString:@""];
        NSString *head=[px split:@"Documents"][0];
        head=[head add:@"Library/Caches/"];
        bool t= [head mkdir];
//        NSString *npath=[px replace:@"Documents" withString:@"Library/Caches"];
        NSString *npath=[head add:@"1.mp4"];
//
   
        
        [[NSFileManager defaultManager] copyItemAtPath:px toPath:npath error:NULL];
//        [px copyToPath:npath];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(npath)) {
            //保存视频到相簿
            UISaveVideoAtPathToSavedPhotosAlbum(npath, self,
                                                nil, nil);
        }
        
        
    }
}
- (BOOL)copyMissingFile:(NSString *)sourcePath toPath:(NSString *)toPath
{
    BOOL retVal = YES; // If the file already exists, we'll return success…
    NSString * finalLocation = [toPath stringByAppendingPathComponent:[sourcePath lastPathComponent]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:finalLocation])
    {
        retVal = [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:finalLocation error:NULL];
    }
    return retVal;
}
- (void)realPlayCallBack:(PLAY_STATE)playState realManager:(RealPlayManager *)realPlayManager{
    
}
-(void)getPlayTime:(WXModuleCallback)callback{
    [self.vc getPlayTime:callback];
}


@end
