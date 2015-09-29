//
//  DeviceView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "DeviceView.h"

@implementation DeviceView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        int y = MARGIN_TOP;
        int len = frame.size.width-2*MARGIN;
        
        _deviceButton = [[ImageButton alloc] initWithFrame:CGRectMake(MARGIN, y, len, BUTTONHEIGHT) andDefaultImage:nil];
        //_deviceButton.backgroundColor = [UIColor grayColor];
        [_deviceButton setTitleColor:[UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
        [_deviceButton setTitle:@"添加设备" forState:UIControlStateNormal];
        [self addSubview:_deviceButton];
        
        y+=BUTTONHEIGHT+MARGIN;
        
        _cancleButton = [[ImageButton alloc] initWithFrame:CGRectMake(MARGIN, y, len, BUTTONHEIGHT)];
        //_cancleButton.backgroundColor = [UIColor grayColor];
        [_cancleButton setTitleColor:[UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
        [_cancleButton setTitle:@"返回" forState:UIControlStateNormal];
        [self addSubview:_cancleButton];
    }
    return self;
}
@end
