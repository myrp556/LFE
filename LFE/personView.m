//
//  personView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "personView.h"

@implementation personView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
        _labels = @[@"性别", @"身高", @"年龄", @"体重"];
        _values = @[@"男", @"172cm", @"24", @"60kg"];
        
        int y = MARGIN_TOP;
        int llen = frame.size.width-MARGIN*2-LABELLEN;
        for (int i=0; i<[_labels count]; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, y, LABELLEN, LINEHEIGHT)];
            label.font = [UIFont systemFontOfSize:LINEHEIGHT];
            label.text = _labels[i];
            [self addSubview:label];
            
            UIButton *value = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN+LABELLEN, y-4, llen, LINEHEIGHT+8)];
            value.layer.contents = (id)[UIImage imageNamed:@"blank"].CGImage;
            [value setTitle:_values[i] forState:UIControlStateNormal];
            //value.font = [UIFont systemFontOfSize:LINEHEIGHT];
            //value.titleLabel.text = _values[i];
            //value.layer.contents = (id)[UIImage imageNamed:@"blank"].CGImage;
            //value.textAlignment = NSTextAlignmentCenter;
            [self addSubview:value];
            y+=LINEHEIGHT+MARGIN;
        }
        
        _cancleButton = [[ImageButton alloc] initWithFrame:CGRectMake(MARGIN, y,frame.size.width-2*MARGIN, BUTTONHEIGHT) andDefaultImage:nil];
        [_cancleButton setTitleColor:[UIColor colorWithRed:6/255.0 green:129/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
        
        //_cancleButton.backgroundColor = [UIColor grayColor];
        [_cancleButton setTitle:@"返回" forState:UIControlStateNormal];
        [self addSubview:_cancleButton];
    }
    return self;
}
@end
