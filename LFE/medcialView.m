//
//  medcialView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "medcialView.h"

@interface medcialView()
@property int width;
@property int height;
@end

@implementation medcialView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        _width = frame.size.width;
        _height = frame.size.height;
        
        _baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width*2, _height)];
        [self addSubview:_baseView];
        
        _footImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, MARGIN_TOP-15, _width, _height/2-MARGIN_TOP+15)];
        _footImageView.layer.contents = (id)[UIImage imageNamed:@"foot"].CGImage;
        //_footImageView.backgroundColor = [UIColor blueColor];
        [_baseView addSubview:_footImageView];
        
        _chartView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CHART_WIDTH, CHART_HEIGHT)];
        [_chartView setCenter:CGPointMake(_width/2, _height/2+(_height/2)/2)];
        [_baseView addSubview:_chartView];
        
        _boneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_width, 0, _width, _height)];
        _boneImageView.backgroundColor = [UIColor grayColor];
        [_baseView addSubview:_boneImageView];
        
        _chart = [[LineAndBarChart alloc] initWithView:_chartView isLine:NO];
        _chart.xVlues = @[@"穴位1", @"穴位2", @"穴位3", @"穴位4", @"穴位5", @"穴位6"];
        _chart.yValue = @[@[@"20,", @"34", @"55", @"28", @"31", @"41"]];
        _chart.low = 0;
        _chart.high = 70;
        
        _tagIndex = 0;
        UISwipeGestureRecognizer *leftSwip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
        leftSwip.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:leftSwip];
        
        UISwipeGestureRecognizer *rightSwip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
        rightSwip.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:rightSwip];
    }
    return self;
}

- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swip");
    if (sender.direction==UISwipeGestureRecognizerDirectionRight) {
        if (_tagIndex<1) {
            _tagIndex++;
            [UIView animateWithDuration:0.3 animations:^{
                [_baseView setCenter:CGPointMake(_width, _height/2)];
            }completion:^(BOOL finish) {
                
            }];
        }
    } else {
        if (_tagIndex>0) {
            _tagIndex--;
            if (_tagIndex==0) {
                [_chart showInTheView];
            }
            [UIView animateWithDuration:0.3 animations:^{
                [_baseView setCenter:CGPointMake(0, _height/2)];
            }completion:^(BOOL finish) {
                
            }];
        }
    }
}

@end
