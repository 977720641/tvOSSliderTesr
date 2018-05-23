//
//  GTKTVSliderProgressView.h
//  tvOSSlider
//
//  Created by geniatech on 2018/5/23.
//  Copyright © 2018年 geniatech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTKTVSliderProgressView;

@protocol GTKTVSliderProgressViewDelegate <NSObject>
@optional
- (void)slideableProgressViewStartChange:(GTKTVSliderProgressView*)slider;
- (void)slideableProgressViewValueChanged:(GTKTVSliderProgressView*)slider;
- (void)slideableProgressViewEndChange:(GTKTVSliderProgressView*)slider;

@end




@interface GTKTVSliderProgressView : UIProgressView

@property (strong,nonatomic) UIColor  *focusedProgressColor;//获取焦点后的进度条颜色
@property (strong,nonatomic) UIColor *unfocusedProgressColor;//失去焦点后的进度条颜色
@property (assign,nonatomic) double value;//模仿silder的值

@property (weak,nonatomic) id delegate;

- (instancetype)initWithDelegate:(id<GTKTVSliderProgressViewDelegate> )delegate;
- (void)setValue:(float)value animated:(BOOL)animated;

@end
