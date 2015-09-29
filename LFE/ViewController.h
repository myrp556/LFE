//
//  ViewController.h
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUChart.h"
#import "ImageButton.h"
#import "PageView.h"
#import "LineAndBarChart.h"
#import "BarChart.h"
#import "SportsView.h"
#import "medcialView.h"
#import "SportsAddView.h"
#import "SupportView.h"
#import "SettingMain.h"
#import "personView.h"
#import "DeviceView.h"

#define TAGBUTTON_SIZE 30

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *toolBarView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSMutableArray *pages;
@property (strong, nonatomic) SportsView *sportsView;
@property (strong, nonatomic) medcialView *medcialView;
@property (strong, nonatomic) SportsAddView *sportsAddView;
@property (strong, nonatomic) SupportView *supportView;
@property (strong, nonatomic) SettingMain *settingView;

@end

