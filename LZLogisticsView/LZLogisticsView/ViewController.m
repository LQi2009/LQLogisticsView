//
//  ViewController.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZLogisticsView.h"
#import "LZLogisticModel.h"

@interface ViewController ()

@property (strong, nonatomic)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
    LZLogisticsView *logis = [[LZLogisticsView alloc]initWithDatas:self.dataArray];
    logis.frame = self.view.bounds;
    
    [self.view addSubview:logis];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}
- (void)loadData {
    for (int i = 0; i < 20; i++) {
        LZLogisticModel *model = [[LZLogisticModel alloc]init];
        NSString *str = @"北京顺义顺丰转运中心";
        NSString *new = nil;
        NSArray *arr = @[@"北京顺义顺丰转运中心北京顺义顺丰转运中心",@"北京顺义顺丰转运中心",@"北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心",@"北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心",@"北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心北京顺义顺丰转运中心"];
        int num = arc4random() % arr.count;
        
        model.dsc = [arr objectAtIndex:num];
//        model.dsc = str;
        model.date = @"2016-07-15";
        [self.dataArray addObject:model];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
