//
//  ViewController.m
//  LFE
//
//  Created by Yuntao Wang on 15/9/21.
//  Copyright (c) 2015年 Yuntao Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int width;
@property int height;
@property int scrollHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _width = [[UIScreen mainScreen] bounds].size.width;
    _height = [[UIScreen mainScreen] bounds].size.height;
    _scrollHeight = _height-self.toolBarView.frame.size.height;
    
    _buttons = [[NSMutableArray alloc] initWithCapacity:10];
    _pages = [[NSMutableArray alloc] initWithCapacity:10];
    
    int tagButtonMargin = (_width-TAGBUTTON_SIZE*4)/5;
    _toolBarView.layer.contents = (id)[UIImage imageNamed:@"tagbar"].CGImage;
    
    for (int i=0; i<4; i++) {
        ImageButton *button = [[ImageButton alloc] initWithFrame:CGRectMake(tagButtonMargin*(i+1)+TAGBUTTON_SIZE*i, (_toolBarView.frame.size.height-TAGBUTTON_SIZE)/2, TAGBUTTON_SIZE, TAGBUTTON_SIZE) andDefaultImage:nil];
        button.index = i;
        [_buttons addObject:button];
        [_toolBarView addSubview:button];
    }

    [(ImageButton *)_buttons[0] setDefaultImage:[UIImage imageNamed:@"sports_white"]];
    [(ImageButton *)_buttons[0] setHighlightImage:[UIImage imageNamed:@"sports_blue"]];
    [(ImageButton *)_buttons[1] setDefaultImage:[UIImage imageNamed:@"med_white"]];
    [(ImageButton *)_buttons[1] setHighlightImage:[UIImage imageNamed:@"med_blue"]];
    [(ImageButton *)_buttons[2] setDefaultImage:[UIImage imageNamed:@"sup_white"]];
    [(ImageButton *)_buttons[2] setHighlightImage:[UIImage imageNamed:@"sup_blue"]];
    [(ImageButton *)_buttons[3] setDefaultImage:[UIImage imageNamed:@"set_white"]];
    [(ImageButton *)_buttons[3] setHighlightImage:[UIImage imageNamed:@"set_blue"]];
    
    [(ImageButton *)_buttons[0] setOn];

    for (int i=1; i<4; i++) [(ImageButton *)_buttons[i] setOff];
    
    for (int i=3; i>=0; i--) {
        PageView *page = [[PageView alloc] initWithFrame:CGRectMake(0, 0, _width, _height-_toolBarView.frame.size.height)];
        page.index = i;
        [_pages addObject:page];
        [self.view addSubview:page];
    }
    
    [self.view bringSubviewToFront:(UIView *)_pages[0]];
    
    SportsView *sportView = [[SportsView alloc] initWithFrame:CGRectMake(0, 0, _width, 1250)];
    //((PageView *)_pages[0]).backgroundColor = [UIColor grayColor];
    [(PageView *)_pages[0] addPage:sportView withAnimation:NO];
    [sportView showCharts];
    
    medcialView *mView = [[medcialView alloc] initWithFrame:CGRectMake(0, 0, _width, _height-_toolBarView.frame.size.height)];
    [(PageView *)_pages[1] addPage:mView withAnimation:NO];
    [mView.chart showInTheView];
    
    //[sportView.standChart.chart showInView:self];
    
    for (int i=0; i<4; i++) {
        [(UIButton *)_buttons[i] addTarget:self action:@selector(onTagButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _sportsAddView = [[SportsAddView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    _sportsAddView.center = CGPointMake(_width/2, _scrollHeight+_sportsAddView.frame.size.height/2);
    [self.view addSubview:_sportsAddView];
    
    [_sportsView.addButton addTarget:self action:@selector(onSportAddButtonsPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [_sportsView.testButton addTarget:self action:@selector(onSportsCancleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_sportsAddView.cancleButton addTarget:self action:@selector(onSportsCancleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i=0; i<[_sportsAddView.addButtons count]; i++) {
        ImageButton* button = (ImageButton *)_sportsAddView.addButtons[i];
        //[button addTarget:self action:@selector(onSportAddButtonsAddPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    _supportView = [[SupportView alloc] initWithFrame:CGRectMake(0, 0, _width, _scrollHeight)];
    [(PageView *)_pages[2] addPage:_supportView withAnimation:NO];
    
    _settingView = [[SettingMain alloc] initWithFrame:CGRectMake(0, 0, _width, _scrollHeight)];
    [(PageView *)_pages[3] addPage:_settingView withAnimation:NO];
    
    [_settingView.personButton addTarget:self action:@selector(onPersonButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_settingView.deviceButton addTarget:self action:@selector(onDeviceButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view bringSubviewToFront:_sportsAddView];
    [self.view bringSubviewToFront:_toolBarView];
    //[self onSportsAddButtonPress:self];
}

- (IBAction)onDeviceButtonPress:(id)sender {
    DeviceView *deviceView = [[DeviceView alloc] initWithFrame:CGRectMake(0, 0, _width, _scrollHeight)];
    [deviceView.cancleButton addTarget:self action:@selector(onSetViewRetreat:) forControlEvents:UIControlEventTouchUpInside];
    [(PageView *)_pages[3] addPage:deviceView withAnimation:YES];
}
- (IBAction)onSetViewRetreat:(id)sender {
    [(PageView *)_pages[3] removePageWithAnimation:YES];
}

- (IBAction)onPersonButtonPress:(id)sender {
    NSLog(@"person");
    personView *pView = [[personView alloc] initWithFrame:CGRectMake(0, 0, _width, _scrollHeight)];
    [pView.cancleButton addTarget:self action:@selector(onSetViewRetreat:) forControlEvents:UIControlEventTouchUpInside];
    [(PageView *)_pages[3] addPage:pView withAnimation:YES];
}


- (IBAction)onSportsCancleButtonPress:(id)sender {
    NSLog(@"cancle");
    [_sportsAddView hide];
}

- (IBAction)onSportAddButtonsPress:(id)sender {
    NSLog(@"add!");
    [_sportsAddView show];
}

- (IBAction)onTagButtonClick:(id)sender {
    int index = ((ImageButton *)sender).index;
    NSLog(@"%d", index);
    [self.view bringSubviewToFront:(PageView *)_pages[index]];
    [(ImageButton *)_buttons[0] setOff];
    if (index==0) [(ImageButton *)_buttons[0] setOn];
    [(ImageButton *)_buttons[1] setOff];
    if (index==1) [(ImageButton *)_buttons[1] setOn];
    [(ImageButton *)_buttons[2] setOff];
    if (index==2) [(ImageButton *)_buttons[2] setOn];
    [(ImageButton *)_buttons[3] setOff];
    if (index==3) [(ImageButton *)_buttons[3] setOn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
