//
//  LZLogisticModel.m
//  LZLogisticsView
//
//  Created by Artron_LQQ on 16/7/15.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZLogisticModel.h"
#import "LZConfigFile.h"

@interface LZLogisticModel ()
{
    
}
@property (assign, nonatomic)CGFloat tempHeight;
@end
@implementation LZLogisticModel

- (CGFloat)height {
    
    if (_tempHeight == 0) {
        
        NSDictionary * dict=[NSDictionary dictionaryWithObject: [UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
        
        CGRect rect=[self.dsc boundingRectWithSize:CGSizeMake(kLZScreenWidth - lz_leftSpace - 2*lz_rightSpace, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        
        _tempHeight = rect.size.height + 50;;
        NSLog(@"aaaaaaa");
    }
    
    
    NSLog(@"%@<<>>>>%f",self.dsc,_tempHeight);
    
    return _tempHeight;
}

@end
