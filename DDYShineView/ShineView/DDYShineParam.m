//
//  DDYShineParam.m
//  AH_Enterprise
//
//  Created by AOHY on 2017/12/19.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import "DDYShineParam.h"

@implementation DDYShineImage

+(UIImage *)getImage:(ShineImage)shineImage {
    
    UIImage *image;
    switch (shineImage) {
        case Heart:
            image = [DDYShineImage imageFromBundle:@"heart"];
            break;
        case Like:
            image = [DDYShineImage imageFromBundle:@"like"];
            break;
        case Smile:
            image = [DDYShineImage imageFromBundle:@"smile"];
            break;
        case Star:
            image = [DDYShineImage imageFromBundle:@"star"];
            break;
        default:
            break;
    }
    return image;
}

+(UIImage *)imageFromBundle:(NSString *)name {
    return  [UIImage imageNamed:name];
}
@end
@implementation DDYShineParam

-(instancetype)init {
    if ([super init]) {
        self.allowRandomColor = false;
        self.animDuration = 1;
        self.bigShineColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        self.enableFlashing = false;
        self.shineCount = 7;
        self.shineTurnAngle = 20;
        self.shineDistanceMultiple = 1.5;
        self.smallShineOffsetAngle = 20;
        self.smallShineColor = [UIColor lightGrayColor];
        self.shineSize = 0;
        self.colorRandom = @[
                             [UIColor colorWithRed:255/255.0 green:255/255.0 blue:153/255.0 alpha:1],
                             [UIColor colorWithRed:255/255.0 green:204/255.0 blue:204/255.0 alpha:1],
                             [UIColor colorWithRed:153/255.0 green:102/255.0 blue:153/255.0 alpha:1],
                             [UIColor colorWithRed:153/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                             [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1],
                             [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1],
                             [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                             [UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1],
                             [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                             [UIColor colorWithRed:153/255.0 green:153/255.0 blue:51/255.0 alpha:1]
                             ];
    }
    return self;
}
@end
