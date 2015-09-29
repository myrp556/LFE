//
//  SupportView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "SupportView.h"

@interface SupportView ()
@property int height;
@property int width;
@end

@implementation SupportView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        _height = frame.size.height;
        _width = frame.size.width;
        NSLog(@"widht: %d", _width);
        
        int viewHeight = (_height-MARGIN*2-MARGINTOP)/2;
        int viewWidth = (_width-MARGIN*2);
        _view1 = [[UIImageView alloc] initWithFrame:CGRectMake(MARGIN, MARGINTOP, viewWidth, viewHeight)];
        //_view1.backgroundColor = [UIColor grayColor];
        _view1.layer.contents = (id)[UIImage imageNamed:@"stand_gray"].CGImage;
        _view1.userInteractionEnabled = YES;
        [self addSubview:_view1];
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, LABEL_HEIGHT)];
        _label1.font = [UIFont systemFontOfSize:LABEL_HEIGHT];
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.center = CGPointMake(_width/2, MARGIN+viewHeight/2);
        _label1.text = @"1";
        //[self addSubview:_label1];
        
        _view2 = [[UIImageView alloc] initWithFrame:CGRectMake(MARGIN, MARGINTOP+MARGIN+viewHeight, viewWidth, viewHeight)];
        //_view2.backgroundColor = [UIColor grayColor];
        _view2.layer.contents = (id)[UIImage imageNamed:@"sit_gray"].CGImage;
        _view2.userInteractionEnabled = YES;
        [self addSubview:_view2];
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, LABEL_HEIGHT)];
        _label2.font = [UIFont systemFontOfSize:LABEL_HEIGHT];
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.center = CGPointMake(_width/2, MARGIN*2+viewHeight+viewHeight/2);
        _label2.text = @"2";
        //[self addSubview:_label2];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onStandPress:)];
        [_view1 addGestureRecognizer:tap1];
        
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSitPress:)];
        [_view2 addGestureRecognizer:tap2];
        
    }
    return self;
}

- (IBAction)onSitPress:(id)sender {
    _view1.layer.contents = (id)[UIImage imageNamed:@"stand_gray"].CGImage;
    _view2.layer.contents = (id)[UIImage imageNamed:@"set_light"].CGImage;
}

- (IBAction)onStandPress:(id)sender {
    _view1.layer.contents = (id)[UIImage imageNamed:@"stand_light"].CGImage;
    _view2.layer.contents = (id)[UIImage imageNamed:@"sit_gray"].CGImage;
}
@end
