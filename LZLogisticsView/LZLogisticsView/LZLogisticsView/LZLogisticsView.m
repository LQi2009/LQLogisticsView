//
//  LZLogisticsView.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZLogisticsView.h"
#import "LZConfigFile.h"
#import "LZLogisticCell.h"
#import "LZTableHeaderView.h"

@interface LZLogisticsView () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)UITableView *table;
@end

@implementation LZLogisticsView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (instancetype)initWithDatas:(NSArray*)array {
    self = [super init];
    if (self) {
        
        [self.dataArray addObjectsFromArray:array];
//        [self setupUI];
    }
    
    return self;
}

- (void)setDatas:(NSArray *)datas {
    if (_datas == datas) {
        
        _datas = datas;
    }
    
    [self.table reloadData];
}

- (void)reloadDataWithDatas:(NSArray *)array {
    
    [self.dataArray addObjectsFromArray:array];
    [self.table reloadData];
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)setupUI {
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:table];
    [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.table = table;
    
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [table registerClass:[LZTableHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZLogisticCell *cell = [tableView dequeueReusableCellWithIdentifier:@"logisticsCellIdentifier"];
    if (cell == nil) {
        
        cell = [[LZLogisticCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"logisticsCellIdentifier"];
    }
    
    if (indexPath.row == 0) {
        cell.hasUpLine = NO;
        cell.currented = YES;
    } else {
        cell.hasUpLine = YES;
        cell.currented = NO;
//        cell.currentTextColor = nil;
    }
    
    if (indexPath.row == self.dataArray.count - 1) {
        cell.hasDownLine = NO;
    } else {
        cell.hasDownLine = YES;
    }
    
    LZLogisticModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell reloadDataWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZLogisticModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    return model.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    LZTableHeaderView *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    
    header.number = @"12345554t636647";
    header.company = @"顺丰速运";
    header.phone = @"10086";
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 100;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
