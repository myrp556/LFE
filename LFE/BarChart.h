//
//  BarChart.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBPieChart.h"

@interface BarChart : UIView
@property (nonatomic, strong)VBPieChart *chart;
@property (nonatomic, strong)NSMutableArray *values;
@property (nonatomic, strong)NSMutableArray *names;
@property (nonatomic, strong)NSMutableArray *colors;

- (id)initWithFrame:(CGRect)frame;
- (void)showInTheView;

@end
