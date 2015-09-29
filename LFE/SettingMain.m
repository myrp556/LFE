//
//  SettingMain.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "SettingMain.h"

@interface SettingMain()
@property int width;
@property int height;
@end

@implementation SettingMain

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        _width = frame.size.width;
        _height = frame.size.height;
        
        int y = MARGIN_TOP;
        int buttonWidth = _width-2*MARGIN;
        _personButton = [[ImageButton alloc] initWithFrame:CGRectMake(MARGIN, y, buttonWidth, BUTTONHEIGHT)];
        [_personButton setTitleColor:[UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
        //_personButton.titleLabel.textColor = [UIColor blueColor];
        //_personButton.backgroundColor = [UIColor grayColor];
        [_personButton setTitle:@"个人信息" forState:UIControlStateNormal];
        [self addSubview:_personButton];
        
        y+=BUTTONHEIGHT+MARGIN;
        _deviceButton = [[ImageButton alloc] initWithFrame:CGRectMake(MARGIN, y, buttonWidth, BUTTONHEIGHT)];
        //_deviceButton.backgroundColor = [UIColor grayColor];
        [_deviceButton setTitleColor:[UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
        [_deviceButton setTitle:@"我的设备" forState:UIControlStateNormal];
        [self addSubview:_deviceButton];
        
        
    }
    return self;
}

@end
