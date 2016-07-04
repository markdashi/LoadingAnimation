//
//  ViewController.m
//  loadingAnimation
//
//  Created by apple on 4/7/16.
//  Copyright © 2016年 mark. All rights reserved.
//

#import "ViewController.h"
#import "CABasicAnimation+Category.h"
#import "LoadingView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
  NSMutableArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.title = @"加载等待动画";
    
         /**加载等到动画*/
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    
        tableView.delegate   = self;
        tableView.dataSource = self;
    
        [self.view addSubview:tableView];
    
    
        array = [NSMutableArray arrayWithObjects:
                 @"circleLoadingView",
                 @"lineLoadingView",
                 @"dotLoadingView",
                 @"showCircleJoinView", nil];

    
    
    /*
    2.闪烁动画。
    UIImageView *myTest1 = [[UIImageView alloc]init];
    
    [myTest1 setImage:[UIImage imageNamed:@"Home_deviceSelect"]];
    myTest1.layer.position = CGPointMake(0, 0);
    myTest1.center = self.view.center;
    [myTest1 sizeToFit];
    [self.view addSubview:myTest1];
    
    
    [myTest1.layer addAnimation:[CABasicAnimation opacityForever_Animation:0.5] forKey:nil];
    
    */
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    switch (indexPath.row) {
        case 0:
            [LoadingView showCircleView:vc.view];
            break;
        case 1:
            [LoadingView showLineView:vc.view];
            break;
        case 2:
            [LoadingView showDotView:vc.view];
            break;
        case 3:
            [LoadingView showCircleJoinView:vc.view];
            break;
        default:
            break;
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
