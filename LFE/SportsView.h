//
//  SportsView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineAndBarChart.h"
#import "ImageButton.h"
#import "ChartView.h"
#import "SportsAddView.h"

#define MARGIN_TOP 50
#define CHART_WIDTH 300
#define CHART_HEIGHT 200
#define CHART_MARGIN 30
#define BUTTON_SIZE 40

@interface SportsView : UIView
@property (strong, nonatomic) LineAndBarChart *stateChart;
@property (strong, nonatomic) LineAndBarChart *standChart;
@property (strong, nonatomic) LineAndBarChart *sitChart;
@property (strong, nonatomic) LineAndBarChart *dunChart;
@property (strong, nonatomic) LineAndBarChart *lieChart;
@property (strong, nonatomic) ImageButton *addButton;
@property (strong, nonatomic) ChartView *stateChartView;
@property (strong, nonatomic) ChartView *standChartView;
@property (strong, nonatomic) ChartView *sitChartView;
@property (strong, nonatomic) ChartView *dunChartView;
@property (strong, nonatomic) ChartView *lieChartView;
@property (strong, nonatomic) UIButton *testButton;
@property (strong, nonatomic) SportsAddView *sports;

- (id)initWithFrame:(CGRect)frame;
- (void)showCharts;

@end
