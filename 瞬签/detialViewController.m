//
//  detialViewController.m
//  瞬签
//
//  Created by app on 17/4/28.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "detialViewController.h"

@interface detialViewController ()
{
    
    CGFloat w;
    CGFloat h;
    NSArray *photoSourse;
    NSInteger photoRandomCount;
    UITextView *TextField;

}
@end

@implementation detialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"all thing";
    w = [[UIScreen mainScreen]bounds].size.width;
    h = [[UIScreen mainScreen]bounds].size.height;
    /**
     *  创建背景
     */
    photoSourse = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    photoRandomCount = arc4random()%4;
    UIImageView *imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    imageView.image = [UIImage imageNamed:photoSourse[photoRandomCount]];
    [self.view addSubview:imageView];
    /**
     创建细节窗口
     */
    TextField = [[UITextView alloc]initWithFrame:CGRectMake(20, 64, w-40, h)];
    //addTextField.placeholder = @"快来写点东西吧，你看都空了！";
    TextField.alpha = 0.9;
    TextField.text = _textString;
    [self .view addSubview:TextField];
    // Do any additional setup after loading the view.
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
