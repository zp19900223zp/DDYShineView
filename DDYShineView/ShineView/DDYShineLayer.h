//
//  DDYShineLayer.h
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/19.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DDYShineParam.h"
#import "DDYShineAngleLayer.h"
typedef void (^endAnim)(void);

@interface DDYShineLayer : CALayer
@property(nonatomic,strong)DDYShineParam *params;
@property(nonatomic, strong)UIColor *fillColor;
@property (nonatomic, copy) endAnim endAnim;
-(void)startAnim;

@end
