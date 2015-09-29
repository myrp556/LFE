//
//  PageView.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "PageView.h"

@interface PageView()
@property int width;
@property int height;
@end

@implementation PageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _pages = [[NSMutableArray alloc] initWithCapacity:10];
        _pageOffsets = [[NSMutableArray alloc] initWithCapacity:10];
        _width = frame.size.width;
        _height = frame.size.height;
        _pageIndex = 0;
        _index = -1;
        [self setBounces:NO];
        [self setScrollEnabled:YES];
        [self showsHorizontalScrollIndicator];
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPageWidth:(int)widht Height:(int)height {
    NSLog(@"%d, %d", widht, height);
    self.contentSize = CGSizeMake(widht, height);
}

- (void)addPage:(UIView *)view withAnimation:(BOOL)withAnimation{
    [_pages addObject:view];
    [_pageOffsets addObject:[NSNumber numberWithFloat:[self contentOffset].y]];
    
    [self setContentOffset:CGPointMake(0, 0)];
    
    [view setCenter:CGPointMake(_width+view.frame.size.width/2, view.frame.size.height/2)];
    [self addSubview:view];
    if (withAnimation==YES) {
        [UIView animateWithDuration:0.3 animations:^{
            [view setCenter:CGPointMake(_width/2, view.frame.size.height/2)];
        }completion:^(BOOL finish) {
            _pageIndex++;
            [self setPageWidth:view.frame.size.width Height:view.frame.size.height];
        }];
    } else {
        [view setCenter:CGPointMake(_width/2, view.frame.size.height/2)];
        _pageIndex++;
        [self setPageWidth:(int)view.frame.size.width Height:(int)view.frame.size.height];
        //NSLog(@"%f %f", view.frame.size.width, view.frame.size.height);
    }
}

- (void)removePageWithAnimation:(BOOL)withAnimation {
    if ([_pages count]<=1) return;
    UIView *view = [_pages lastObject];
    [_pages removeObject:view];
    
    if (withAnimation==YES) {
        [UIView animateWithDuration:0.3 animations:^{
            [view setCenter:CGPointMake(_width+view.frame.size.width/2, view.frame.size.height/2)];
        }completion:^(BOOL finish) {
            [view removeFromSuperview];
            _pageIndex--;
            [self setContentOffset:CGPointMake(0, [((NSNumber *)_pageOffsets[_pageIndex]) floatValue])];
            [self setPageWidth:view.frame.size.width Height:view.frame.size.height];
            [view removeFromSuperview];
        }];
    } else {
        [view setCenter:CGPointMake(_width+view.frame.size.width/2, view.frame.size.height/2)];
        [view removeFromSuperview];
        _pageIndex--;
        [self setContentOffset:CGPointMake(0, [((NSNumber *)_pageOffsets[_pageIndex]) floatValue])];
        [self setPageWidth:view.frame.size.width Height:view.frame.size.height];
        [view removeFromSuperview];
    }
}
@end
