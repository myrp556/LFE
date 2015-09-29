//
//  SportsView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "SportsView.h"
#import "UUColor.h"

@interface SportsView()
@property int width;
@property int height;
@end

@implementation SportsView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _width = frame.size.width;
        _height = frame.size.height;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        UIView *shade = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 415, 735)];
        shade.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        [self addSubview:shade];
        
        int chartx = (frame.size.width-CHART_WIDTH)/2;
        int y = MARGIN_TOP;
        
        _stateChartView = [[ChartView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT) withChar:1];
        _stateChartView.label.text = @"综合";
        _stateChartView.uchart.low = 0;
        _stateChartView.uchart.high = 100;
        _stateChartView.uchart.xVlues = @[@"站", @"坐", @"蹲", @"躺"];
        _stateChartView.uchart.yValue = @[@[@"40", @"25", @"5", @"30"]];
        //_stateChartView.uchart.colors = @[UUBlue];
        [self addSubview:_stateChartView];
        /*UIView *stateChartView = [[UIView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT)];
        _stateChart = [[LineAndBarChart alloc] initWithView:stateChartView isLine:NO];
        _stateChart.low = 0;
        _stateChart.high = 100;
        _stateChart.xVlues = @[@"站", @"坐", @"蹲", @"躺"];
        _stateChart.yValue = @[@[@"40", @"25", @"5", @"30"]];
        [self addSubview:stateChartView];*/
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _standChartView = [[ChartView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT) withChar:0];
        _standChartView.label.text = @"站";
        _standChartView.uchart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _standChartView.uchart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        //_stateChartView.uchart.colors = @[UUYellow];
        [self addSubview:_standChartView];
        /*UIView *standChartView = [[UIView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT)];
        _standChart = [[LineAndBarChart alloc] initWithView:standChartView isLine:YES];
        _standChart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _standChart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        [self addSubview:standChartView];*/
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _sitChartView = [[ChartView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT) withChar:0];
        _sitChartView.label.text = @"坐";
        _sitChartView.uchart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _sitChartView.uchart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        //_sitChartView.uchart.colors = @[UUGreen];
        [self addSubview:_sitChartView];
        /*UIView *sitChartView = [[UIView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT)];
        _sitChart = [[LineAndBarChart alloc] initWithView:sitChartView isLine:YES];
        _sitChart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _sitChart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        [self addSubview:sitChartView];*/
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _dunChartView = [[ChartView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT) withChar:0];
        _dunChartView.label.text = @"蹲";
        _dunChartView.uchart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _dunChartView.uchart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        //_dunChartView.uchart.colors = @[UUPinkGrey];
        [self addSubview:_dunChartView];
        /*UIView *dunChartView = [[UIView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT)];
        _dunChart = [[LineAndBarChart alloc] initWithView:dunChartView isLine:YES];
        _dunChart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _dunChart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        [self addSubview:dunChartView];*/
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _lieChartView = [[ChartView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT) withChar:0];
        _lieChartView.label.text = @"躺";
        _lieChartView.uchart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _lieChartView.uchart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        _lieChartView.uchart.colors = @[UUBrown];
        [self addSubview:_lieChartView];
        /*UIView *lieChartView = [[UIView alloc] initWithFrame:CGRectMake(chartx, y, CHART_WIDTH, CHART_HEIGHT)];
        _lieChart = [[LineAndBarChart alloc] initWithView:lieChartView isLine:YES];
        _lieChart.yValue = @[@[@"2", @"12", @"40", @"35", @"56", @"21"]];
        _lieChart.xVlues = @[@"6:00", @"8:00", @"10:00", @"12:00", @"14:00", @"16:00", @"18:00"];
        [self addSubview:lieChartView];*/
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _addButton = [[ImageButton alloc] initWithFrame:CGRectMake(0, 0, BUTTON_SIZE, BUTTON_SIZE-3)];
        //_addButton.backgroundColor = [UIColor grayColor];
        [_addButton setCenter:CGPointMake(_width/2, y+BUTTON_SIZE/2)];
        //[_addButton setTitle:@"加" forState:UIControlStateNormal];
        _addButton.layer.contents = (id)[UIImage imageNamed:@"add_button"].CGImage;
        
        [self addSubview:_addButton];
        [self bringSubviewToFront:_addButton];
        
        y+=CHART_HEIGHT+CHART_MARGIN;
        _testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BUTTON_SIZE, BUTTON_SIZE)];
        _testButton.backgroundColor = [UIColor grayColor];
        [_testButton setCenter:CGPointMake(_width/2, y+BUTTON_SIZE/2)];
        [_testButton setTitle:@"加" forState:UIControlStateNormal];
        [self addSubview:_testButton];
        [self bringSubviewToFront:_testButton];
        //[self showCharts];
        
        [_addButton addTarget:self action:@selector(onAddPress:) forControlEvents:UIControlEventTouchUpInside];
        _sports = [[SportsAddView alloc] initWithFrame:CGRectMake(0, 0, 120, 100)];
        [self addSubview:_sports];
    }
    return self;
}

- (IBAction)onAddPress:(id)sender {
    NSLog(@"add!");
    _sports.center = CGPointMake(_width/2, _height+_sports.frame.size.height/2);
    [_sports show];
}

- (void)showCharts {
    //[_stateChart showInTheView];
    [_stateChartView showInTheView];
    [_standChartView showInTheView];
    [_sitChartView showInTheView];
    [_dunChartView showInTheView];
    [_lieChartView showInTheView];
    //[_standChart showInTheView];
    //[_sitChart showInTheView];
    //[_dunChart showInTheView];
    //[_lieChart showInTheView];
}
@end
