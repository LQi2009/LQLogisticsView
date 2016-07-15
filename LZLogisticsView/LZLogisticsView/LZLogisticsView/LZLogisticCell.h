//
//  LZLogisticCell.h
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZLogisticModel.h"

@interface LZLogisticCell : UITableViewCell

@property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *currentColor;

@property (strong, nonatomic) UIColor *TextColor;
@property (strong, nonatomic) UIColor *currentTextColor;

@property (assign, nonatomic) BOOL hasUpLine;
@property (assign, nonatomic) BOOL hasDownLine;
@property (assign, nonatomic) BOOL currented;

- (void)reloadDataWithModel:(LZLogisticModel*)model;
@end
