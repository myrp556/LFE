//
//  ChartView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineAndBarChart.h"
#import "BarChart.h"

#define LABELHEIGHT 30
#define MARGIN 10

@interface ChartView : UIView
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) LineAndBarChart *uchart;
@property (strong, nonatomic) BarChart *vchart;
@property (strong, nonatomic) UIView *chartView;

- (id)initWithFrame:(CGRect)frame withChar:(int)type;
- (void)showInTheView;

@end
