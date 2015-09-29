//
//  SportsAddView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageButton.h"
#define MARGIN 10
#define LINE_HEIGHT 20

@interface SportsAddView : UIView
@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSMutableArray *addButtons;
@property (strong, nonatomic) ImageButton *cancleButton;

- (id)initWithFrame:(CGRect)frame;
- (void)show;
- (void)hide;
@end
