//
//  SupportView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/22.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MARGIN 10
#define LABEL_HEIGHT 30
#define MARGINTOP 50

@interface SupportView : UIView
@property (strong, nonatomic) UIImageView *view1;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UIImageView *view2;
@property (strong, nonatomic) UILabel *label2;

- (id)initWithFrame:(CGRect)frame;
@end
