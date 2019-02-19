//
//  DDYShineButton.m
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/20.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import "DDYShineButton.h"
@interface DDYShineButton()
@property(nonatomic, strong)DDYShineClickLayer *clickLayer;
@property(nonatomic, strong)DDYShineLayer *shineLayer;
@end

@implementation DDYShineButton

-(instancetype)initWithFrame:(CGRect)frame  parmas:(DDYShineParam *)params {
    self = [[DDYShineButton alloc]initWithFrame:frame];
    self.params = params;
    self.color = [UIColor lightGrayColor];
    self.fillColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
    self.image = [DDYShineImage getImage:Heart];
    [self initLayers];
    return self;
}
-(instancetype)init{
    if( [super init ]){
        self.color = [UIColor lightGrayColor];
        self.fillColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
        self.image = [DDYShineImage getImage:Heart];
        [self initLayers];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.color = [UIColor lightGrayColor];
        self.fillColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
        self.image = [DDYShineImage getImage:Heart];
        [self initLayers];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if([super initWithCoder:aDecoder]){
        self.color = [UIColor lightGrayColor];
        self.fillColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
        self.image = [DDYShineImage getImage:Heart];
        [self initLayers];
    }
    return self;
}
-(DDYShineClickLayer *)clickLayer {
    if (_clickLayer == nil) {
        _clickLayer = [[DDYShineClickLayer alloc]init];
    }
    return _clickLayer;
}
-(DDYShineLayer *)shineLayer {
    if (_shineLayer == nil) {
        _shineLayer = [[DDYShineLayer alloc]init];
    }
    return _shineLayer;
}
-(void)setParams:(DDYShineParam *)params {
    _params = params;
    self.clickLayer.animDuration = _params.animDuration / 3;
    self.shineLayer.params = _params;
}
-(void)setImage:(UIImage *)image {
    _image = image;
    self.clickLayer.image = image;
}
-(void)setColor:(UIColor *)color {
    _color = color;
    self.clickLayer.color = _color;
}

-(void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.clickLayer.fillColor = _fillColor;
    self.shineLayer.fillColor = _fillColor;
}
-(void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    self.clickLayer.clicked = isSelected;
}
-(void)initLayers {
    self.clickLayer.animDuration = self.params.animDuration/3;
    self.shineLayer.params = self.params;
    [self.layer addSublayer:self.clickLayer];
    [self.layer addSublayer:self.shineLayer];
}
-(void)setNorImg:(UIImage *)norImg {
    _norImg = norImg;
    self.clickLayer.norImg = _norImg;
}
-(void)setSelImg:(UIImage *)selImg{
    _selImg = selImg;
    self.clickLayer.selImg = _selImg;
}
-(void)setClicked:(BOOL)clicked animated:(BOOL)animated {
    
    if (clicked != self.clickLayer.clicked) {
        
    }else{
        return;
    }
    if (clicked) {
        __weak typeof(self) weakSelf = self;
        self.shineLayer.endAnim = ^{
            weakSelf.clickLayer.clicked = clicked;
            if (animated) {
                [weakSelf.clickLayer startAnim];
            }
            weakSelf.isSelected = clicked;
        };
        if (animated) {
            [self.shineLayer startAnim];
        }else{
            [self.shineLayer endAnim];
        }
        
    }else{
        self.clickLayer.clicked = clicked;
        self.isSelected = clicked;
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    __weak typeof(self) weakSelf = self;
    if (self.clickLayer.clicked == false) {
        self.shineLayer.endAnim = ^{
            if (weakSelf.clickLayer.clicked == false) {
                
            }else{
                weakSelf.clickLayer.clicked = !weakSelf.clickLayer.clicked;
            }
            [weakSelf.clickLayer startAnim];
            weakSelf.isSelected = !weakSelf.isSelected;
            [weakSelf sendActionsForControlEvents:UIControlEventValueChanged];
        };
        [self.shineLayer startAnim];
    }else{
        self.clickLayer.clicked = !weakSelf.clickLayer.clicked;
        self.isSelected = !weakSelf.isSelected;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.clickLayer.frame = self.bounds;
    self.shineLayer.frame = self.bounds;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
