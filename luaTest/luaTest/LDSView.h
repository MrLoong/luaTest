//
//  LDSView.h
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDSBundle.h"
#import "RegisterManager.h"
#import <lV.h>


@interface LDSView : UIView

/**
 *  状态机
 */
@property (nonatomic, assign) lv_State* lvState; // lua 状态机

/**
 *  资源检索
 */
@property (nonatomic,strong) LDSBundle* bundle;


// 所在的ViewController
@property (nonatomic,weak) UIViewController* viewController;



/**
 *  初始化
 *
 *  @param frame 布局
 *
 *  @return LDSView
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  运行脚本文件
 *
 *  @param scriptName 脚本明
 *
 *  @return 运行状态
 */
-(NSString *)runScriptWithScriptName:(NSString *)scriptName;




@end
