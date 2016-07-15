//
//  LZLogisticCell.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZLogisticCell.h"
#import "LZConfigFile.h"
#import "LZTableCellContentView.h"

@interface LZLogisticCell ()

@property (strong, nonatomic)LZTableCellContentView *customView;
@end
@implementation LZLogisticCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
    }
    
    return self;
}

- (void)reloadDataWithModel:(LZLogisticModel*)model {
    
    [self.customView reloadDataWithModel:model];
}

- (void)setHasUpLine:(BOOL)hasUpLine {
    
    self.customView.hasUpLine = hasUpLine;
}

- (void)setHasDownLine:(BOOL)hasDownLine {
    
    self.customView.hasDownLine = hasDownLine;
}

- (void)setCurrented:(BOOL)currented {
    
    self.customView.currented = currented;
}

- (void)setupUI {
    
    LZTableCellContentView *custom = [[LZTableCellContentView alloc]init];
    [self addSubview:custom];
    self.customView = custom;
    
    custom.currented = NO;
    custom.hasUpLine = YES;
    custom.hasDownLine = YES;
    [custom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
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
