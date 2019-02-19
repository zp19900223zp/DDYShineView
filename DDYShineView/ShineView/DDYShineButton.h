//
//  DDYShineButton.h
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/20.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDYShineParam.h"
#import "DDYShineAngleLayer.h"
#import "DDYShineLayer.h"
#import "DDYShineClickLayer.h"
@interface DDYShineButton : UIControl

@property(nonatomic, strong)DDYShineParam *params;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIColor *fillColor;
@property(nonatomic, strong)UIImage *image;
@property(nonatomic, assign)BOOL isSelected;
@property(nonatomic,strong)UIImage *selImg;
@property(nonatomic,strong)UIImage *norImg;
-(instancetype)initWithFrame:(CGRect)frame  parmas:(DDYShineParam *)param;
-(void)setClicked:(BOOL)clicked animated:(BOOL)animated;

@end
