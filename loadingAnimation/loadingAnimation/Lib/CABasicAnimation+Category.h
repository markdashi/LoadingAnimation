//
//  CABasicAnimation+Category.h
//  beizerPath
//
//  Created by apple on 27/6/16.
//  Copyright © 2016年 mark. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (Category)


/**
 *  forever twinkling  永久闪烁的动画
 *
 *  @param time   time duration 持续时间
 *
 *  @return self   返回当前类
 */
+ (CABasicAnimation *)opacityForever_Animation:(float)time;

@end
