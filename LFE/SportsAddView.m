//
//  SportsAddView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "SportsAddView.h"

@interface SportsAddView()
@property int width;
@property int heigth;
@end

@implementation SportsAddView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
        self.hidden = YES;
        _width = frame.size.width;
        _heigth = frame.size.height;
        
        _labels = [[NSMutableArray alloc] initWithCapacity:10];
        _addButtons = [[NSMutableArray alloc] initWithCapacity:10];
        int y = MARGIN;
        
        UILabel *baskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, _width, LINE_HEIGHT)];
        baskLabel.font = [UIFont systemFontOfSize:LINE_HEIGHT];
        baskLabel.text = @"篮球";
        baskLabel.textAlignment = NSTextAlignmentCenter;
        baskLabel.textColor = [UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1];
        [self addSubview:baskLabel];
        [_labels addObject:baskLabel];
        
        ImageButton *addButton0 = [[ImageButton alloc] initWithFrame:CGRectMake(_width-MARGIN-LINE_HEIGHT, y, LINE_HEIGHT, LINE_HEIGHT)];
        addButton0.index = 0;
        [addButton0 setTitle:@"加" forState:UIControlStateNormal];
        //addButton0.backgroundColor = [UIColor redColor];
        //[self addSubview:addButton0];
        //[_addButtons addObject:addButton0];
        
        y+=LINE_HEIGHT+10;
        
        UILabel *socLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, _width, LINE_HEIGHT)];
        socLabel.font = [UIFont systemFontOfSize:LINE_HEIGHT];
        socLabel.text = @"足球";
        socLabel.textAlignment = NSTextAlignmentCenter;
        socLabel.textColor = [UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1];
        [self addSubview:socLabel];
        [_labels addObject:socLabel];
        
        ImageButton *addButton1 = [[ImageButton alloc] initWithFrame:CGRectMake(_width-MARGIN-LINE_HEIGHT, y, LINE_HEIGHT, LINE_HEIGHT)];
        addButton1.index = 0;
        [addButton1 setTitle:@"加" forState:UIControlStateNormal];
        //[self addSubview:addButton1];
        //[_addButtons addObject:addButton1];
        
        y+=LINE_HEIGHT+10;
        
        _cancleButton = [[ImageButton alloc] initWithFrame:CGRectMake(0, y, _width, LINE_HEIGHT)];
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1] forState:UIControlStateNormal];
        [self addSubview:_cancleButton];
        
        [_cancleButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)show {
    self.hidden = NO;
    int x = self.center.x;
    int y = self.center.y;
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(x, y-_heigth);
    }completion:^(BOOL finished) {
        
    }];
}

- (void)hide {
    if (self.hidden==YES) return;
    int x = self.center.x;
    int y = self.center.y;
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(x, y+_heigth);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
@end
