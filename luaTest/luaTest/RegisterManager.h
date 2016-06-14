//
//  RegisterManager.h
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDSLable.h"
#import "LDSView.h"
#import <lVstate.h>


@interface RegisterManager : NSObject

/**
 *  API注册管理
 *
 *  @param lvState 状态机
 *  @param LDSView LDSView
 */
+(void)registerApiWithlvState:(lv_State*)lvState;

@end
