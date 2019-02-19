//
//  DDYShineLayer.m
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/19.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import "DDYShineLayer.h"

@interface DDYShineLayer ()<CAAnimationDelegate>


@property(nonatomic, strong)CAShapeLayer *shapeLayer;
@property(nonatomic, strong)CADisplayLink *displaylink;

@end

@implementation DDYShineLayer

-(instancetype)init {
    if ([super init]) {
        self.fillColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //self.fillColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self initLayers];
    }
    return self;
}
-(CAShapeLayer *)shapeLayer {
    if (_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer new];
    }
    return _shapeLayer;
}
-(void)initLayers {
    self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    self.shapeLayer.strokeColor = self.fillColor.CGColor;
    self.shapeLayer.lineWidth = 1.5;
    [self addSublayer:self.shapeLayer];
}
-(void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    _fillColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    self.shapeLayer.strokeColor = self.fillColor.CGColor;
}
-(void)startAnim {
    CABasicAnimation *anim =  [CABasicAnimation   animationWithKeyPath:@"path"];
    anim.duration = self.params.animDuration * 0.1;
    CGSize size =  self.frame.size;
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:1 startAngle:0 endAngle:M_PI * 2.0 clockwise:false];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 * 1.5  startAngle:0 endAngle:M_PI * 2.0 clockwise:false];
    anim.delegate = self;
    
    anim.fromValue = (__bridge id _Nullable)(fromPath.CGPath);
    anim.toValue = (__bridge id _Nullable)(toPath.CGPath);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion= NO;
    anim.fillMode = kCAFillModeForwards;
    [self.shapeLayer addAnimation:anim forKey:@"path"];
    if (self.params.enableFlashing) {
        [self startFlash];
    }
    
}
-(void)startFlash {
    self.displaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(flashAction)];
    // 判断iOS 10.0的系统
    if (@available(iOS 10.0, *)) {
        self.displaylink.preferredFramesPerSecond = 6;
    }else{
        self.displaylink.frameInterval = 10;
    }
    [self.displaylink addToRunLoop: [NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)flashAction {
    int index = arc4random()%self.params.colorRandom.count;
    self.shapeLayer.strokeColor = self.params.colorRandom[index].CGColor;
    
}
#pragma mark CAAnimationDelegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self.displaylink invalidate];
        self.displaylink = nil;
        [self.shapeLayer removeAllAnimations];
        DDYShineAngleLayer *angleLayer = [[DDYShineAngleLayer alloc]initFrame:self.bounds params:self.params];
        [self addSublayer:angleLayer];
        [angleLayer startAnim];
        self.endAnim();
    }
}
@end
