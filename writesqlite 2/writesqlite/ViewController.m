//
//  ViewController.m
//  writesqlite
//
//  Created by 大麦 on 16/2/22.
//  Copyright (c) 2016年 lsp. All rights reserved.
//

#import "ViewController.h"
#import "sqliteSDk/include/sqliteLibrary/SqliteDB.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *mutArray;

@end

#define createButtonWithStatus(buttonFrame,buttonTitle,buttonTitleColor)\
^(void)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
[button setTitle:buttonTitle forState:UIControlStateNormal];\
[button setTitleColor:buttonTitleColor forState:UIControlStateNormal];\
[button setFrame:buttonFrame];\
return button;\
}()

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self start];
    [self InterFace];
}

-(void)InterFace
{
    self.mutArray = [NSMutableArray array];
    [self.mutArray addObject:@"创建"];
    [self.mutArray addObject:@"打开"];
    [self.mutArray addObject:@"插入"];
    [self.mutArray addObject:@"删除"];
    [self.mutArray addObject:@"修改"];
    [self.mutArray addObject:@"查询"];
    //
    for(int i=0;i<[self.mutArray count];i++)
    {
        NSString *buttonTitle = [self.mutArray objectAtIndex:i];
        UIColor *buttonTitleColor = [UIColor blackColor];
        CGRect buttonFrame = CGRectMake(100, 100+50*i, 100, 40);
        //
        UIButton *button = createButtonWithStatus(buttonFrame, buttonTitle, buttonTitleColor);
        button.tag = i+10;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)buttonAction:(UIButton *)button
{
    int index = button.tag-10;
    NSLog(@"%@",[self.mutArray objectAtIndex:index]);
    if(index==0)
    {
        [[SqliteDB sharedSqliteDB] createDB];
    }
    else if(index==1)
    {
        [[SqliteDB sharedSqliteDB] openDB];
    }
    else if(index==2)
    {
        [[SqliteDB sharedSqliteDB] inserDB];
    }
    else if(index==3)
    {
        [[SqliteDB sharedSqliteDB] deleteAll];
    }
    else if(index==4)
    {
        [[SqliteDB sharedSqliteDB] updateDB];
    }
    else if(index==5)
    {
        [[SqliteDB sharedSqliteDB] searchDB];
        //        NSMutableArray *arr = [[SqliteDB sharedSqliteDB] searchDB];
        //        NSLog(@"arr=%@",arr);
    }
}
@end
