//
//  LZTableHeaderView.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/15.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTableHeaderView.h"
#import "LZConfigFile.h"

@interface LZTableHeaderView ()

@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) UILabel *comLabel;
@property (strong, nonatomic) UILabel *phoneLabel;
@end
@implementation LZTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setPhone:(NSString *)phone {
    
    self.phoneLabel.text = phone;
}

- (void)setNumber:(NSString *)number {
    
    self.numLabel.text = number;
}

- (void)setCompany:(NSString *)company {
    
    self.comLabel.text = company;
}

- (void)setupUI {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textColor = [UIColor grayColor];
    label1.text = @"订单编号:";
    [bgView addSubview:label1];
    
    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.font = [UIFont systemFontOfSize:16];
    [bgView addSubview:numLabel];
    self.numLabel = numLabel;
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textColor = [UIColor grayColor];
    label2.text = @"承运人:";
    [bgView addSubview:label2];
    
    UILabel *comLabel = [[UILabel alloc]init];
    comLabel.font = [UIFont systemFontOfSize:16];
    [bgView addSubview:comLabel];
    self.comLabel = comLabel;
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.font = [UIFont systemFontOfSize:16];
    label3.textColor = [UIColor grayColor];
    label3.text = @"承运人电话:";
    [bgView addSubview:label3];
//    label1.backgroundColor = [UIColor orangeColor];
//    label2.backgroundColor = [UIColor redColor];
//    label3.backgroundColor = [UIColor cyanColor];;
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    [bgView addSubview:phoneLabel];
    self.phoneLabel = phoneLabel;
    
    CGFloat leftSpace = 10;
    CGFloat width = 100;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(-leftSpace);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bgView).offset(leftSpace);
        make.top.mas_equalTo(bgView).offset(leftSpace);
        make.height.mas_equalTo(label2);
        make.width.mas_equalTo(@(width));
        make.bottom.mas_equalTo(label2.mas_top);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(label1);
        make.top.mas_equalTo(label1.mas_bottom);
        make.bottom.mas_equalTo(label3.mas_top);
        make.height.mas_equalTo(label3);
    }];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.mas_equalTo(label1);
        make.top.mas_equalTo(label2.mas_bottom);
        make.bottom.mas_equalTo(bgView).offset(leftSpace).offset(-leftSpace);
    }];
    
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label1);
        make.left.mas_equalTo(label1.mas_right).offset(leftSpace);
        make.bottom.mas_equalTo(label1);
        make.right.mas_equalTo(bgView).offset(-leftSpace);
    }];
    
    [comLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(numLabel.mas_bottom);
        make.left.mas_equalTo(numLabel);
        make.right.mas_equalTo(numLabel);
        make.bottom.mas_equalTo(phoneLabel.mas_top);
    }];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(comLabel);
        make.top.mas_equalTo(comLabel.mas_bottom);
        make.bottom.mas_equalTo(bgView).offset(-leftSpace);
    }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
