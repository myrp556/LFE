//
//  ImageButton.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageButton : UIButton
@property (nonatomic, strong)UIImage *defaultImage;
@property (nonatomic, strong)UIImage *highlightImage;
@property int index;

- (id)initWithFrame:(CGRect)frame andDefaultImage:(UIImage *)image;
- (void)setOn;
- (void)setOff;
@end
