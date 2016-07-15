//
//  LZLogisticsView.h
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZLogisticsView : UIView

@property (strong, nonatomic)NSArray *datas;

- (instancetype)initWithDatas:(NSArray*)array;
- (void)reloadDataWithDatas:(NSArray *)array;
@end
