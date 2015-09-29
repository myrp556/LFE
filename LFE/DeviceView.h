//
//  DeviceView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageButton.h"

#define MARGIN_TOP 50
#define MARGIN 20
#define LINEHEIGHT 15
#define LABELLEN 200
#define VALUELEN 200
#define BUTTONHEIGHT 30

@interface DeviceView : UIView
@property (strong, nonatomic) ImageButton *deviceButton;
@property (strong, nonatomic) ImageButton *cancleButton;

- (id)initWithFrame:(CGRect)frame;
@end
