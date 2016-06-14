//
//  LDSLable.m
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "LDSLable.h"

@implementation LDSLable

-(id) init:(NSString*)text lv_State:(lv_State*) lvState{
    self = [super init];
    if( self ){
        self.text = text;
        self.backgroundColor = [UIColor blueColor];
        self.textAlignment = NSTextAlignmentLeft;
        self.clipsToBounds = YES;
        self.font = [UIFont systemFontOfSize:14];
        self.frame = CGRectMake(30, 30, 200, 200);
    }
    return self;
}

static int ldsNewLabel(lv_State *lvState){
    NSString* text = @"成功调用";
    LDSLable* label = [[LDSLable alloc] init:text lv_State:lvState];
    LDSView* view = (__bridge LDSView *)(lvState->lView);
    [view addSubview:label];
    
    NSLog(@"进入label的创建");
    
    return 1;
}

+(void)classDefine:(lv_State *)lvState{
    lv_pushcfunction(lvState, ldsNewLabel);
    lv_setglobal(lvState, "Label");
}

@end
