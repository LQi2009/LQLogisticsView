//
//  LZLogisticCell.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZLogisticCell.h"
#import "LZConfigFile.h"

@interface LZLogisticCell ()

@property (strong, nonatomic)UILabel *infoLabel;
@property (strong, nonatomic)UILabel *dateLabel;
@end
@implementation LZLogisticCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _lineColor = LZRGBColor(185, 185, 185);
        _currented = NO;
        _hasUpLine = YES;
        _hasDownLine = YES;
        [self setupUI];
    }
    
    return self;
}

- (void)reloadDataWithModel:(LZLogisticModel*)model {
    
    self.infoLabel.text = model.dsc;
    self.dateLabel.text = model.date;
    
    [self setNeedsDisplay];
}

- (void)setupUI {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:bgView];
//    self.backgroundView = bgView;
    UILabel *info= [[UILabel alloc]init];
    info.text = @"[北京顺义区顺义机场公司]派件人:xxx 派件中 派件员电话12345666777";
    info.font = [UIFont systemFontOfSize:12];
    info.numberOfLines = 0;
    info.textColor = LZRGBColor(139, 139, 139);
    [self.contentView addSubview:info];
    _infoLabel = info;
    
    UILabel *date = [[UILabel alloc]init];
    date.text = @"2016-07-13 04:30";
    date.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:date];
    _dateLabel = date;
    
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = LZRGBColor(238, 238, 238);
    [self.contentView addSubview:line];
    
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
    
    [info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(10);
        make.left.mas_equalTo(self).offset(lz_leftSpace);
        make.right.mas_equalTo(self).offset(-lz_rightSpace);
        make.bottom.mas_equalTo(date.mas_top).offset(-4);
    }];
    
    [date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(info);
        make.bottom.mas_equalTo(self).offset(-10);
        make.right.mas_equalTo(info);
        make.top.mas_equalTo(info.mas_bottom).offset(4);
        make.height.mas_equalTo(@20);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lz_leftSpace);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.height.mas_equalTo(@1);
    }];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat height = self.bounds.size.height;
    CGFloat cicleWith = self.currented?12:6;
//    CGFloat shadowWith = cicleWith/3.0;
    
    if (self.hasUpLine) {
        
        UIBezierPath *topBezier = [UIBezierPath bezierPath];
        [topBezier moveToPoint:CGPointMake(lz_leftSpace/2.0, 0)];
        [topBezier addLineToPoint:CGPointMake(lz_leftSpace/2.0, height/2.0 - cicleWith/2.0 - cicleWith/6.0)];
        
        topBezier.lineWidth = 1.0;
        UIColor *stroke = self.lineColor;
        [stroke set];
        [topBezier stroke];
    }
    
    if (self.currented) {
        
        UIBezierPath *cicle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lz_leftSpace/2.0 - cicleWith/2.0, height/2.0 - cicleWith/2.0, cicleWith, cicleWith)];
        
        cicle.lineWidth = cicleWith/3.0;
        UIColor *cColor = LZRGBAColor(255, 128, 0, 1.0);
        [cColor set];
        [cicle fill];
        
        UIColor *shadowColor = LZRGBAColor(255, 128, 0, 0.5);
        [shadowColor set];
        
        
        [cicle stroke];
    } else {
        
        UIBezierPath *cicle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lz_leftSpace/2.0-cicleWith/2.0, height/2.0 - cicleWith/2.0, cicleWith, cicleWith)];
        
        UIColor *cColor = self.lineColor;
        [cColor set];
        [cicle fill];
        
        [cicle stroke];
    }
    
    if (self.hasDownLine) {
        
        UIBezierPath *downBezier = [UIBezierPath bezierPath];
        [downBezier moveToPoint:CGPointMake(lz_leftSpace/2.0, height/2.0 + cicleWith/2.0 + cicleWith/6.0)];
        [downBezier addLineToPoint:CGPointMake(lz_leftSpace/2.0, height)];
        
        downBezier.lineWidth = 1.0;
        UIColor *stroke = self.lineColor;
        [stroke set];
        [downBezier stroke];
    }
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
