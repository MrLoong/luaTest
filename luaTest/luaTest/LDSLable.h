//
//  LDSLable.h
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <lV.h>
#import "LDSView.h"

@interface LDSLable : UILabel


/**
 *  生成class
 *
 *  @param lvState 状态机
 */
+(void)classDefine:(lv_State *)lvState;


-(id) init:(NSString*)text lv_State:(lv_State*) lvState;

@end
