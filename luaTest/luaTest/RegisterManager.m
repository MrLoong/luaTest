//
//  RegisterManager.m
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "RegisterManager.h"

@implementation RegisterManager

+(void)registerApiWithlvState:(lv_State*)lvState{
    [LDSLable classDefine:lvState];
    
}

@end
