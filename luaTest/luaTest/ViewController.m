//
//  ViewController.m
//  luaTest
//
//  Created by LastDays on 16/6/7.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "ViewController.h"
#import <LView.h>
#import "LDSView.h"
@interface ViewController ()

@property(nonatomic,strong) LView *lview;

@property(nonatomic,strong) LDSView *ldsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LDSView];
}

/**
 *  测试我们的思路
 */
-(void)LDSView{
    CGRect cg = self.view.bounds;
    cg.origin = CGPointZero;
    self.ldsView = [[LDSView alloc] initWithFrame:cg];
    [self.view addSubview:self.ldsView];
    [self.ldsView runScriptWithScriptName:@"lastdays.lua"];
}


/**
 *  测试LuaVIewSDK
 */
-(void)LuaVIewSDK{
    CGRect cg = self.view.bounds;
    cg.origin = CGPointZero;
    self.lview = [[LView alloc] initWithFrame:cg];
    self.lview.viewController = self;
    [self.view addSubview:self.lview];
    [self.lview runFile:@"button.lua"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
