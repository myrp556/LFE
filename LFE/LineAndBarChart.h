//
//  LineAndBarChart.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UUChart.h"
#import <UIKit/UIKit.h>

@interface LineAndBarChart : NSObject
@property (nonatomic, strong)UUChart *chart;
@property (nonatomic, strong)NSMutableArray *xVlues;
@property (nonatomic, strong)NSMutableArray *yValue;
@property (nonatomic, strong)NSMutableArray *colors;
@property int low;
@property int high;
@property (strong, nonatomic)UIView *theView;

- (id)initWithView:(UIView *)view isLine:(BOOL)line;
- (void)showInTheView;

@end
