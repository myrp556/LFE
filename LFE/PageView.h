//
//  PageView.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIScrollView

@property (nonatomic, strong)NSMutableArray *pages;
@property (nonatomic, strong)NSMutableArray *pageOffsets;
@property int pageIndex;
@property int index;

- (id)initWithFrame:(CGRect)frame;
- (void)setPageWidth:(int)widht Height:(int)height;
- (void)addPage:(UIView *)view withAnimation:(BOOL)withAnimation;
- (void)removePageWithAnimation:(BOOL)withAnimation;

@end
