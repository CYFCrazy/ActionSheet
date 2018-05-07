//
//  SheetTableViewCell.m
//  JiuAiTou
//
//  Created by Aphy_Cui on 2018/5/4.
//  Copyright © 2018年 深圳万利金融. All rights reserved.
//

#import "SheetTableViewCell.h"

@implementation SheetTableViewCell{
    UILabel *_text_label;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        _text_label = [[UILabel alloc] init];
        _text_label.backgroundColor = [UIColor whiteColor];
        _text_label.font = [UIFont systemFontOfSize:18];
        _text_label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_text_label];
    }
    return self;
}

-(void)setTitle_Str:(NSString *)title_Str{
    _title_Str = title_Str;
    _text_label.text = title_Str;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _text_label.frame = CGRectMake(0, 1, self.frame.size.width, self.frame.size.height-1);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
