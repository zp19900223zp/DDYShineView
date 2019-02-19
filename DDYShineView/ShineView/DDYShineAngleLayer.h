//
//  DDYShineAngleLayer.h
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/19.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DDYShineParam.h"
@interface DDYShineAngleLayer : CALayer

@property(nonatomic,strong)DDYShineParam *params;
-(instancetype)initFrame:(CGRect )frame params:(DDYShineParam *)params;
-(void)startAnim;

@end
