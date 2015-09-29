//
//  SettingMain.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageButton.h"

#define MARGIN_TOP 50
#define MARGIN 10
#define BUTTONHEIGHT 30

@interface SettingMain : UIView
@property (strong, nonatomic) ImageButton *personButton;
@property (strong, nonatomic) ImageButton *deviceButton;

- (id)initWithFrame:(CGRect)frame;
@end
