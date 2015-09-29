//
//  LineAndBarChart.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "LineAndBarChart.h"

@interface LineAndBarChart ()<UUChartDataSource> {

}
@end

@implementation LineAndBarChart

- (id)initWithView:(UIView *)view isLine:(BOOL)line {
    self = [super init];
    if (self) {
        _theView = view;
        _xVlues = [[NSMutableArray alloc] initWithCapacity:10];
        _yValue = [[NSMutableArray alloc] initWithCapacity:10];
        _colors = [[NSMutableArray alloc] initWithCapacity:10];
        _low = -1;
        _high = -1;
        _chart = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) withSource:self withStyle:line==YES?UUChartLineStyle:UUChartBarStyle];
    }
    return self;
}

- (NSArray *)UUChart_xLableArray:(UUChart *)chart {
    //NSLog(@"x: %@", _xVlues);
    return _xVlues;
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart {
    //NSLog(@"y: %@", _yValue);
    return _yValue;
}

- (void)showInTheView {
    if (_theView && _xVlues && [_xVlues count]>0 && _yValue && [_yValue count]>0 && [(NSMutableArray *)_yValue[0] count]>0)
        [_chart showInView:_theView];
    else
        NSLog(@"can't show chars");
}

- (NSArray *)UUChart_ColorArray:(UUChart *)chart {
    if (_colors && [_colors count]>0) return _colors;
    else return nil;
}

- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart {
    if (_low>=0 && _high>=0) return CGRangeMake(_high, _low);
    //NSLog(@"... %d %d", _low, _high);
    return CGRangeZero;
}
@end
