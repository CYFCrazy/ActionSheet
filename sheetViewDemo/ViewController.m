//
//  ViewController.m
//  sheetViewDemo
//
//  Created by Aphy_Cui on 2018/5/7.
//  Copyright © 2018年 CYF. All rights reserved.
//

#import "ViewController.h"
#import "sheetView.h"

@interface ViewController ()<sheetViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)action:(id)sender {
    sheetView *view = [[sheetView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"确定退出登录吗？" dataArray:@[@"确定"] cancelText:@"取消" delegate:self];
    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
}

-(void)sheetView:(sheetView *)sheetView didSelectRowAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
