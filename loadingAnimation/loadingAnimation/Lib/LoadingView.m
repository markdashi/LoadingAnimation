//
//  LoadingView.m
//  beizerPath
//
//  Created by apple on 30/6/16.
//  Copyright © 2016年 mark. All rights reserved.
//

#import "LoadingView.h"

static LoadingView *loadView;

typedef enum : NSUInteger {
    LoadingViewCircle,
    LoadingViewDot,
    LoadingViewLine,
    LoadingViewCircleJoin,
} LoadingViewType;



@implementation LoadingView


- (instancetype)initWithFrame:(CGRect)frame type:(LoadingViewType)type
{

    if (self == [super initWithFrame:frame]) {
        
        switch (type) {
            case LoadingViewCircle:
                [self creatAnimation];
                break;
            case LoadingViewDot:
                [self createDotAnimation];
                break;
            case LoadingViewLine:
                [self createLineAnimation];
                break;
                
            case LoadingViewCircleJoin:
                [self creatCircleJoinAnimation];
                break;
                
            default:
                break;
        }
        
        
    }

    return self;
}



#pragma mark - public

+ (void)showDotView:(UIView *)view
{
    loadView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) type:LoadingViewDot];
    loadView.backgroundColor = [UIColor whiteColor];
    loadView.center = view.center;
    [view addSubview:loadView];
}
+ (void)showLineView:(UIView *)view
{

    loadView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) type:LoadingViewLine];
    loadView.backgroundColor = [UIColor whiteColor];
    loadView.center = view.center;
    [view addSubview:loadView];
}
+ (void)showCircleView:(UIView *)view
{

    loadView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) type:LoadingViewCircle];
    loadView.backgroundColor = [UIColor whiteColor];
    loadView.center = view.center;
    [view addSubview:loadView];

}
+ (void)showCircleJoinView:(UIView *)view
{
    loadView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) type:LoadingViewCircleJoin];
    loadView.backgroundColor = [UIColor whiteColor];
    loadView.center = view.center;
    [view addSubview:loadView];

    
}

+ (void)hide{

    if (loadView) {
        [loadView removeFromSuperview];
    }
}



#pragma mark - private method

- (void)creatAnimation

{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds          = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius    = 10.0;
    replicatorLayer.position        =  self.center;
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    
    [self.layer addSublayer:replicatorLayer];
    

    CALayer *dot        = [CALayer layer];
    dot.bounds          = CGRectMake(0, 0, 10, 10);
    dot.position        = CGPointMake(50, 20);
    dot.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.6].CGColor;
    dot.cornerRadius    = 5;
    dot.masksToBounds   = YES;
    
    [replicatorLayer addSublayer:dot];
    
    
    CGFloat count                     = 10.0;
    replicatorLayer.instanceCount     = count;
    CGFloat angel                     = 2* M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration    = 1.0;
    animation.fromValue   = @1;
    animation.toValue     = @0.1;
    animation.repeatCount = MAXFLOAT;
    [dot addAnimation:animation forKey:nil];
    
    
    replicatorLayer.instanceDelay = 1.0/ count;
    
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
}
- (void)creatCircleJoinAnimation

{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds          = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius    = 10.0;
    replicatorLayer.position        =  self.center;
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    
    [self.layer addSublayer:replicatorLayer];
    
    
    CALayer *dot        = [CALayer layer];
    dot.bounds          = CGRectMake(0, 0, 10, 10);
    dot.position        = CGPointMake(50, 20);
    dot.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.6].CGColor;
    dot.cornerRadius    = 5;
    dot.masksToBounds   = YES;
    
    [replicatorLayer addSublayer:dot];
    
    
    CGFloat count                     = 100.0;
    replicatorLayer.instanceCount     = count;
    CGFloat angel                     = 2* M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration    = 1.0;
    animation.fromValue   = @1;
    animation.toValue     = @0.1;
    animation.repeatCount = MAXFLOAT;
    [dot addAnimation:animation forKey:nil];
    
    
    replicatorLayer.instanceDelay = 1.0/ count;
    
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
}


- (void)createLineAnimation{
   
    //1.创建relicatorLayer对象
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds          = CGRectMake(0, 0, 100, 100);
    replicatorLayer.position        = self.center;
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1].CGColor;
    replicatorLayer.cornerRadius    = 10;
    replicatorLayer.masksToBounds   = YES;
    
    [self.layer addSublayer:replicatorLayer];
    
    
    
    CGFloat count = 4;
    CGFloat lineH = 50;
    CGFloat lineMarginX = 30;
    CGFloat lineInter = 10;
    CGFloat lineW = 5;
    
    //2.创建CALayer对象
    CALayer *lineLayer        = [CALayer layer];
    lineLayer.bounds          = CGRectMake(0, 0, lineW, lineH);
    lineLayer.position        = CGPointMake(lineMarginX, replicatorLayer.frame.size.height - 30);
    lineLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    
    [replicatorLayer addSublayer:lineLayer];
    
    
    replicatorLayer.instanceCount = count;
    
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(lineInter, 0, 0);
    
    

    //3.设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue           = @(lineH*0.4);
    animation.duration          = 0.5;
    animation.autoreverses      = YES;
    animation.repeatCount       = MAXFLOAT;
    
    [lineLayer addAnimation:animation forKey:nil];
    
    replicatorLayer.instanceDelay = 0.5 / count;
}

- (void)createDotAnimation{


    //1.创建relicatorLayer对象
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds          = CGRectMake(0, 0, 100, 100);
    replicatorLayer.position        = self.center;
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5].CGColor;
    replicatorLayer.cornerRadius    = 10;
    replicatorLayer.masksToBounds   = YES;
    
    [self.layer addSublayer:replicatorLayer];



    CALayer *dotLayer        = [CALayer layer];
    dotLayer.bounds          = CGRectMake(0, 0, 15, 15);
    dotLayer.position        = CGPointMake(15, replicatorLayer.frame.size.height/2 );
    dotLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    dotLayer.cornerRadius    = 7.5;
    
    [replicatorLayer addSublayer:dotLayer];
    
    
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(replicatorLayer.frame.size.width/3, 0, 0);
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration    = 0.8;
    animation.fromValue   = @1;
    animation.toValue     = @0;
    animation.repeatCount = MAXFLOAT;
    [dotLayer addAnimation:animation forKey:nil];
    
    
    replicatorLayer.instanceDelay = 0.8/3;

    dotLayer.transform = CATransform3DMakeScale(0, 0, 0);
}














@end
