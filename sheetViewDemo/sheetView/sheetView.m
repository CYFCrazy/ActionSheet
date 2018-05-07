//
//  sheetView.m
//  JiuAiTou
//
//  Created by Aphy_Cui on 2018/5/4.
//  Copyright © 2018年 深圳万利金融. All rights reserved.
//

#import "sheetView.h"
#import "SheetTableViewCell.h"

@interface sheetView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
/**
 提示文本（可为空）
 */
@property (nonatomic,copy)NSString *title;

/**
 可点击的选项数组（不为空）
 */
@property (nonatomic,strong)NSArray *dataArray;

/**
 取消文本;
 */
@property (nonatomic,copy)NSString *cancelText;

/**
 点击代理
 */
@property (nonatomic,weak)id <sheetViewDelegate> delegate;


/**
 tableView高度
 */
@property (nonatomic,assign) CGFloat tableViewHeight;

@end

@implementation sheetView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title dataArray:(NSArray *)dataArray cancelText:(NSString *)cancelText delegate:(id<sheetViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
        self.tableViewHeight = 0.0;
        self.title = title;
        self.dataArray = dataArray;
        self.cancelText = cancelText;
        self.delegate = delegate;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    if (self.cancelText != nil) {
        self.tableViewHeight = self.dataArray.count * 50 + 55;
    }else{
        self.tableViewHeight = self.dataArray.count * 50;
    }
    if (self.title != nil) {
        self.tableViewHeight += 55;
    }
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.tableViewHeight) style:(UITableViewStylePlain)];
    self.tableView.scrollEnabled = NO;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (self.title) {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 55)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:headView.frame];
        titleLabel.text = self.title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = [UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
        titleLabel.backgroundColor = [UIColor whiteColor];
        [headView addSubview:titleLabel];
        self.tableView.tableHeaderView = headView;
    }else{
        self.tableView.tableHeaderView = nil;
    }
    if (self.cancelText !=nil) {
        UIView *foootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 55)];
        foootView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 50)];
        footLabel.text = self.cancelText;
        footLabel.textAlignment = NSTextAlignmentCenter;
        footLabel.font = [UIFont systemFontOfSize:18];
        footLabel.textColor = [UIColor blackColor];
        footLabel.backgroundColor = [UIColor whiteColor];
        [foootView addSubview:footLabel];
        self.tableView.tableFooterView = foootView;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
        [foootView addGestureRecognizer:tapGesture];
    }
    [self addSubview:self.tableView];
    [self show];
}
- (void)show
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^
     {
         self.tableView.frame = CGRectMake(0, weakSelf.frame.size.height-weakSelf.tableViewHeight, weakSelf.frame.size.width, weakSelf.tableViewHeight);
         self.backgroundColor = [UIColor colorWithRed:0/255.0
                                                green:0/255.0
                                                 blue:0/255.0
                                                alpha:0.3];
     } completion:^(BOOL finished)
     {
         self.tableView.frame = CGRectMake(0, self.frame.size.height-self.tableViewHeight, self.frame.size.width, weakSelf.tableViewHeight);
         self.backgroundColor = [UIColor colorWithRed:0/255.0
                                                green:0/255.0
                                                 blue:0/255.0
                                                alpha:0.3];
     }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self remove];
}

/**
 移除View
 */
- (void)remove
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^
     {
         weakSelf.tableView.frame = CGRectMake(0, weakSelf.frame.size.height,weakSelf.frame.size.width , weakSelf.tableViewHeight);
         weakSelf.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
         
     } completion:^(BOOL finished)
     {
         [weakSelf.tableView removeFromSuperview];
         [weakSelf removeFromSuperview];
     }];
    
}
//MARK: - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SheetIdentifier = @"SheetIdentifier";
    SheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SheetIdentifier];
    if (!cell) {
        cell = [[SheetTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SheetIdentifier];
    }
    cell.title_Str = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetView:didSelectRowAtIndex:)]) {
        [_delegate sheetView:self didSelectRowAtIndex:indexPath.row];
    }
}

@end
