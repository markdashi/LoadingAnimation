//
//  LoadingView.h
//  beizerPath
//
//  Created by apple on 30/6/16.
//  Copyright © 2016年 mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView


/**
 *  show circle LoadingView
 *
 *  @param view showed
 */
+ (void)showCircleView:(UIView *)view;
/**
 *  show dot LoadingView
 *
 *  @param view showed
 */

+ (void)showDotView:(UIView *)view;

/**
 *  show line LoadingView
 *
 *  @param view showed
 */
+ (void)showLineView:(UIView *)view;

/**
 *  show CircleJoin LoadingView
 *
 *  @param view showed
 */
+ (void)showCircleJoinView:(UIView *)view;

/**
 *  hide loadingView
 */
+ (void)hide;


@end
