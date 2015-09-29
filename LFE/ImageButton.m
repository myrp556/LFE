//
//  ImageButton.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "ImageButton.h"

@implementation ImageButton

- (id)initWithFrame:(CGRect)frame andDefaultImage:(UIImage *)image {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        if (image) _defaultImage = image;
        else _defaultImage = nil;
        _highlightImage = nil;
        _index = -1;
        [self setOff];
    }
    return self;
}

- (void)setOff {
    if (_defaultImage) self.layer.contents = (id)_defaultImage.CGImage;
}

- (void)setOn {
    if (_highlightImage) self.layer.contents = (id)_highlightImage.CGImage;
}

@end
