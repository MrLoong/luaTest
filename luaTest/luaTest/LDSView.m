//
//  LDSView.m
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "LDSView.h"
#import <LVDebuger.h>


@implementation LDSView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self generateLibs];
        self.bundle = [[LDSBundle alloc] init];
    }
    return self;
}

//生成库
-(void)generateLibs{
    self.lvState = lvL_newstate();
    lvL_openlibs(self.lvState);
    
    [RegisterManager registerApiWithlvState:self.lvState];
    self.lvState->lView = (__bridge void *)(self);
    
}

-(NSString *)runScriptWithScriptName:(NSString *)scriptName{
    NSData *code = [self.bundle scriptWithName:scriptName];
    
    
    NSString *result = [[NSString alloc] initWithData:code  encoding:NSUTF8StringEncoding];
    NSLog(@"%@",result);
    
    
    
    return[self runData:code fileName:scriptName];
}


-(NSString*) runData:(NSData *)data fileName:(NSString*)fileName{
    

    lvL_loadbuffer(self.lvState, data.bytes , data.length, fileName.UTF8String) ;
    return lds_runFunctionWithArgs(self.lvState, 0, 0);
    
}

NSString* lds_runFunctionWithArgs(lv_State* l, int nargs, int nret){
    lv_pcall( l, nargs, nret, 0);
    return nil;

}

-(void) containerAddSubview:(UIView *)view{
    
    
    [self addSubview:view];

}

@end
