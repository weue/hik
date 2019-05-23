//
//  WXHikModule.m
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import "WXHikModule.h"
#import "Mcu_sdk/MCUVmsNetSDK.h"
#import "Mcu_sdk/MCUResourceNode.h"

#import "farwolf.h"
#import "farwolf_weex.h"

#import <WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(hik, WXHikModule)
@implementation WXHikModule
WX_EXPORT_METHOD(@selector(login:callback:))
WX_EXPORT_METHOD(@selector(getRoot:))
WX_EXPORT_METHOD(@selector(getSubNodes:pid:callback:))



-(void)login:(NSMutableDictionary*)param callback:(WXModuleCallback)callback{
 
     NSString *url=param[@"url"];
       NSString *user=param[@"user"];
       NSString *password=param[@"password"];
       NSString *mac=param[@"mac"];
      NSString *ip=[url split:@":"][0];
      NSString *port=[url split:@":"][1];
    password=[password toMd5];
    [[MCUVmsNetSDK shareInstance] configMspWithAddress:ip port:port];
    [[MCUVmsNetSDK shareInstance] loginMspWithUsername:user password:password success:^(id responseDic){
        NSInteger result = [responseDic[@"status"] integerValue];
        int res=result == 200?0:res;
        callback(@{@"err":@(res)});
    }failure:^(NSError *error) {
        int res=-1;
        callback(@{@"err":@(res)});
    }];
}

-(void)getRoot:(WXModuleCallback)callback{
    [[MCUVmsNetSDK shareInstance] requestRootNodeWithSysType:1 success:^(id object) {
        if ([object[@"status"] isEqualToString:@"200"]) {
           MCUResourceNode *parentNode = object[@"resourceNode"];
            NSMutableDictionary *dic=[NSMutableDictionary new];
            dic[@"parentNodeType"]=@(parentNode.nodeType);
            dic[@"id"]=parentNode.nodeID;
            callback(dic);

        } else {
            
        }
    } failure:^(NSError *error) {
        
    }];
}

-(void)getSubNodes:(NSInteger)parenttype pid:(NSString*)pId callback:(WXModuleCallback)callback{
    
    [[MCUVmsNetSDK shareInstance] requestResourceWithSysType:1 nodeType:parenttype currentID:pId numPerPage:1000 curPage:1 success:^(id object) {
        
        if ([object[@"status"] isEqualToString:@"200"]) {
            NSMutableArray *resourceArray = object[@"resourceNodes"];
            NSMutableArray *res=[NSMutableArray new];
            for(MCUResourceNode *node in resourceArray){
                NSMutableDictionary *dic=[NSMutableDictionary new];
                dic[@"parentNodeType"]=node.parentNodeID;
                   dic[@"id"]=node.nodeID;
                 dic[@"code"]=node.sysCode;
                 dic[@"name"]=node.nodeName;
                int type=node.nodeType;
                 dic[@"type"]=@(type);
                [res addObject:dic];
            }
            callback(res);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
