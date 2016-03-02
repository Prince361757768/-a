//
//  TestViewController.m
//  demo
//
//  Created by 大麦 on 16/1/25.
//  Copyright (c) 2016年 lsp. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self printA];
}

-(void)printA
{
    NSLog(@"printA");
}

@end
