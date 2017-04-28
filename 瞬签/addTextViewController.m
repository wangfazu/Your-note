//
//  addTextViewController.m
//  瞬签
//
//  Created by app on 17/4/27.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "addTextViewController.h"

@interface addTextViewController ()

@end

@implementation addTextViewController
{
    CGFloat w;
    CGFloat h;
    UITextView *addTextField;
    NSArray *photoSourse;
    NSInteger photoRandomCount;
}

- (void)viewDidLoad {
    w = [[UIScreen mainScreen]bounds].size.width;
    h = [[UIScreen mainScreen]bounds].size.height;
    [super viewDidLoad];
    [self initUI];
    [self dataSouse];
}
- (void)initUI{
    photoSourse = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    photoRandomCount = arc4random()%4;
    UIImageView *imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    imageView.image = [UIImage imageNamed:photoSourse[photoRandomCount]];
    [self.view addSubview:imageView];

    
    //self.view.backgroundColor = [UIColor whiteColor];
    /**
     创建一个可以写字的面板
     */
    addTextField = [[UITextView alloc]initWithFrame:CGRectMake(20, 64, w-40, h)];
    //addTextField.placeholder = @"快来写点东西吧，你看都空了！";
    addTextField.delegate = self;
    addTextField.alpha = 0.9;
    [self .view addSubview:addTextField];
    /**
     *  创建提交的按钮
     */
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(w-20-44,20,44, 44);
    [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [submitBtn setTitle:@"add" forState:UIControlStateNormal];
    
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *BtnRighttem = [[UIBarButtonItem alloc]initWithCustomView:submitBtn];
    self.navigationItem.rightBarButtonItem=BtnRighttem;

   
}
- (void)dataSouse{
    
    
}
- (void)submitBtnClick{
    
    if ([addTextField.text isEqualToString:@""]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    NSString *theAllAddText = addTextField.text;
    [[NSUserDefaults standardUserDefaults]setObject:theAllAddText forKey:@"textStrig"];
    NSLog(@"*********%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"textStrig"]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"theAllAddText" object:nil userInfo:@{@"便签":theAllAddText}];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
