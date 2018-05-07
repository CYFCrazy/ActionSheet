//
//  sheetView.h
//  JiuAiTou
//
//  Created by Aphy_Cui on 2018/5/4.
//  Copyright © 2018年 深圳万利金融. All rights reserved.
//
/*
 使用方法：记得实现代理方法
 sheetView *view = [[sheetView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) title:@"确定退出登录吗？" dataArray:@[@"确定"] cancelText:@"取消" delegate:self];
 [[[UIApplication sharedApplication] keyWindow] addSubview:view];
 */

#import <UIKit/UIKit.h>

@class sheetView;

@protocol sheetViewDelegate <NSObject>
-(void)sheetView:(sheetView *)sheetView didSelectRowAtIndex:(NSInteger)index;
@end

@interface sheetView : UIView

/**
 初始化SheetView

 @param frame frame description
 @param title 提示
 @param dataArray 数据源
 @param cancelText 取消按钮
 @return return value description
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title dataArray:(NSArray *)dataArray cancelText:(NSString *)cancelText delegate:(id <sheetViewDelegate>)delegate;
@end
