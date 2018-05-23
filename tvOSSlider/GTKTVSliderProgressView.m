//
//  GTKTVSliderProgressView.m
//  tvOSSlider
//
//  Created by geniatech on 2018/5/23.
//  Copyright © 2018年 geniatech. All rights reserved.
//

#import "GTKTVSliderProgressView.h"
#define SPEED 3000 //数值越大越慢


@interface GTKTVSliderProgressView()<UIGestureRecognizerDelegate>
{
    
}

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;
@property (assign, nonatomic) CGFloat touchBeganProgress;

@end
@implementation GTKTVSliderProgressView

- (instancetype)initWithDelegate:(id<GTKTVSliderProgressViewDelegate>)delegate{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIColor *)focusedProgressColor{
    if (_focusedProgressColor) {
        return _focusedProgressColor;
    }else{
        return [UIColor whiteColor];
    }
}

- (UIColor *)unfocusedProgressColor{
    if (_unfocusedProgressColor) {
        return _unfocusedProgressColor;
    }else{
        return [UIColor whiteColor];
    }
}

- (double)value{
    return self.progress;
}

- (void)setValue:(double)value{
    [self setProgress:value];
}

-(void)setValue:(float)value animated:(BOOL)animated{
    [self setProgress:value animated:animated];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (!self.panGestureRecognizer) {
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        [self.panGestureRecognizer addTarget:self action:@selector(didPan:)];
        self.panGestureRecognizer.delegate = self;
        [self addGestureRecognizer:self.panGestureRecognizer];
    }
}

- (void)didPan:(UIPanGestureRecognizer *)panGestureRecognizer{
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.touchBeganProgress = self.progress;
        if ([self.delegate respondsToSelector:@selector(slideableProgressViewStartChange:)]) {
            [self.delegate slideableProgressViewStartChange:self];
        }
    }else if(self.panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [self.panGestureRecognizer translationInView:self];
        self.progress = self.touchBeganProgress + (translation.x / SPEED);
        if ([self.delegate respondsToSelector:@selector(slideableProgressViewValueChanged:)]) {
            [self.delegate slideableProgressViewValueChanged:self];
        }
    }else if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnded || self.panGestureRecognizer.state == UIGestureRecognizerStateCancelled || self.panGestureRecognizer.state == UIGestureRecognizerStateFailed){
        if ([self.delegate respondsToSelector:@selector(slideableProgressViewEndChange:)]) {
            [self.delegate slideableProgressViewEndChange:self];
        }
    }
}


- (BOOL)canBecomeFocused{
    return YES;
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.focused;
}





















@end
