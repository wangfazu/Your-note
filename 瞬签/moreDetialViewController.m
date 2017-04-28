//
//  moreDetialViewController.m
//  瞬签
//
//  Created by app on 17/4/27.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "moreDetialViewController.h"

@interface moreDetialViewController ()

@end

@implementation moreDetialViewController
{
    NSArray *photoSourse;
    NSInteger photoRandomCount;
    CGFloat h;
    CGFloat w;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    w = [[UIScreen mainScreen]bounds].size.width;
    h = [[UIScreen mainScreen]bounds].size.height;
    photoSourse = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    photoRandomCount = arc4random()%4;
    UIImageView *imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    imageView.image = [UIImage imageNamed:photoSourse[photoRandomCount]];
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
