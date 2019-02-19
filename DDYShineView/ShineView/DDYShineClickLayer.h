//
//  DDYShineClickLayer.h
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/19.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DDYShineParam.h"
@interface DDYShineClickLayer : CALayer
@property(nonatomic, assign)double animDuration;
@property(nonatomic, strong)UIColor *fillColor;
@property(nonatomic, assign)BOOL clicked;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic, strong)UIImage *image;
@property(nonatomic,strong)UIImage *selImg;
@property(nonatomic,strong)UIImage *norImg;

-(void)startAnim;

@end
