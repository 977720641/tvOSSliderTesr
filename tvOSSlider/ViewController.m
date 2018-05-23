//
//  ViewController.m
//  tvOSSlider
//
//  Created by geniatech on 2018/5/23.
//  Copyright © 2018年 geniatech. All rights reserved.
//

#import "ViewController.h"
#import "GTKTVSliderProgressView.h"


@interface ViewController ()<GTKTVSliderProgressViewDelegate>

@property(nonatomic,strong) GTKTVSliderProgressView *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider = [[GTKTVSliderProgressView alloc] initWithDelegate:self];
    self.slider.delegate = self;
    self.slider.frame = CGRectMake(0, 0, self.view.frame.size.width - 130, 30);
    self.slider.layer.cornerRadius = 15;
    self.slider.center = self.view.center;
    [self.view addSubview:self.slider];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)slideableProgressViewStartChange:(GTKTVSliderProgressView*)slider {
    NSLog(@"11:%lf",self.slider.progress);
}
- (void)slideableProgressViewValueChanged:(GTKTVSliderProgressView*)slider {
    NSLog(@"22:%lf",self.slider.progress);
}
- (void)slideableProgressViewEndChange:(GTKTVSliderProgressView*)slider {
    NSLog(@"33:%lf",self.slider.progress);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
