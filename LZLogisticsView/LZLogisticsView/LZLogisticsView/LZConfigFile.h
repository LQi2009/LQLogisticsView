//
//  LZConfigFile.h
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/14.
//  Copyright © 2016年 Artup. All rights reserved.
//

#ifndef LZConfigFile_h
#define LZConfigFile_h

#define kLZScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kLZScreenHeight ([UIScreen mainScreen].bounds.size.height)

//R G B 颜色
#define LZRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//R G B A 颜色
#define LZRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 \
alpha:(a)]


static CGFloat lz_leftSpace = 50.0;
static CGFloat lz_rightSpace = 10.0;

#import "Masonry.h"
#endif /* LZConfigFile_h */
