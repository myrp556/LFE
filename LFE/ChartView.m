//
//  ChartView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "ChartView.h"

@interface ChartView()
@property int width;
@property int height;
@end

@implementation ChartView

- (id)initWithFrame:(CGRect)frame withChar:(int)type {
    self = [super initWithFrame:frame];
    if (self) {
        _height = frame.size.height;
        _width = frame.size.width;
        //NSLog(@"::%d %d", _width, _height);
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, LABELHEIGHT)];
        _label.font = [UIFont systemFontOfSize:LABELHEIGHT];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        int viewHeight = _height-LABELHEIGHT-5;
        int viewWidth = viewHeight/2*3;
        
        _chartView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
        _chartView.center = CGPointMake(_width/2, LABELHEIGHT+5+viewHeight/2);
        [self addSubview:_chartView];
        
        _uchart = nil;
        _vchart = nil;
        if (type==0) _uchart = [[LineAndBarChart alloc] initWithView:_chartView isLine:YES];
        if (type==1) _uchart = [[LineAndBarChart alloc] initWithView:_chartView isLine:NO];
        if (type==2) {
            _vchart = [[BarChart alloc] initWithFrame:_chartView.frame];
            [self addSubview:_vchart];
        };
    }
    return self;
}

- (void)showInTheView {
    if (_uchart) [_uchart showInTheView];
    else [_vchart showInTheView];
}

@end
