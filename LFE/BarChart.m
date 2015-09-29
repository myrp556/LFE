//
//  BarChart.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "BarChart.h"

@implementation BarChart

- (id)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame];
    if (self) {
        //_chart = [[VBPieChart alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _values = [[NSMutableArray alloc] initWithCapacity:10];
        _colors = [[NSMutableArray alloc] initWithCapacity:10];
        _names = [[NSMutableArray alloc] initWithCapacity:10];
        
        _chart = [[VBPieChart alloc] init];
        int minn = frame.size.height-20;
        if (frame.size.width-20<minn) minn = frame.size.width-20;
        [_chart setFrame:CGRectMake(0, 0, minn,minn)];
        [_chart setCenter:CGPointMake(frame.size.width/2, frame.size.height/2)];
        [_chart setEnableStrokeColor:YES];
        [_chart setHoleRadiusPrecent:0.3];
        
        [_chart.layer setShadowOffset:CGSizeMake(2, 2)];
        [_chart.layer setShadowRadius:3];
        [_chart.layer setShadowColor:[UIColor blackColor].CGColor];
        [_chart.layer setShadowOpacity:0.7];
        [_chart setHoleRadiusPrecent:0.3];
        
        [_chart setLabelsPosition:VBLabelsPositionOnChart];
        //_chart.backgroundColor = [UIColor colorWithIntegerRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
        [self addSubview:_chart];
    }
    return self;
}

- (void)showInTheView {
    if (!_chart) return;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0; i<[_values count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"name", _names[i], @"value", _values[i], @"color", _colors[i], nil];
        [array addObject:dic];
    }
    if ([array count]==0) return;
    [_chart setChartValues:array animation:YES duration:0.3 options:VBPieChartAnimationFan];
}
@end
