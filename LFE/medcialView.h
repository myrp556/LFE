//
//  medcialView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineAndBarChart.h"
#define MARGIN_TOP 50
#define CHART_HEIGHT 200
#define CHART_WIDTH 300

@interface medcialView : UIView
@property (strong, nonatomic)UIView *baseView;
@property (strong, nonatomic)UIImageView *footImageView;
@property (strong, nonatomic)UIView *chartView;
@property (strong, nonatomic)UIImageView *boneImageView;
@property (strong, nonatomic)LineAndBarChart *chart;
@property int tagIndex;
@property (strong, nonatomic)UIView *footView;

- (id)initWithFrame:(CGRect)frame;
@end
