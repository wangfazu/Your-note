//
//  ViewController.m
//  瞬签
//
//  Created by app on 17/4/27.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "ViewController.h"
#import "moreDetialViewController.h"
#import "addTextViewController.h"
#import "detialViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat w;
    CGFloat h;
    UICollectionView *myCollectionView;
    NSMutableArray *dataSourse;
    NSArray *photoSourse;
    NSInteger photoRandomCount;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"瞬签";
    w = [[UIScreen mainScreen]bounds].size.width;
    h = [[UIScreen mainScreen]bounds].size.height;
    [self initUI];
}
- (void)initUI{
    //self.view.backgroundColor = [UIColor purpleColor];
    dataSourse = [[NSMutableArray alloc]init];
    photoSourse = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5"];
    photoRandomCount = arc4random()%5;
    NSLog(@"---------%ld",(long)photoRandomCount);
    /**
     *  创建背景图片
     */
    UIImageView *imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    imageView.image = [UIImage imageNamed:photoSourse[photoRandomCount]];
    [self.view addSubview:imageView];
    /**
     *  添加两个button到导航栏上面
     左边是更多的东西呈现
     右边是tableView的style 的改变
     */
    UIButton * regButLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    regButLeft.frame = CGRectMake(20,20,44, 44);
    
    [regButLeft setTitle:@"更多" forState:UIControlStateNormal];
    [regButLeft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [regButLeft addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:regButLeft];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton * ButRight = [UIButton buttonWithType:UIButtonTypeCustom];
    ButRight.frame = CGRectMake(w-20-44,20,44, 44);
    [ButRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [ButRight setTitle:@"style" forState:UIControlStateNormal];
    
    [ButRight addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *BtnRighttem = [[UIBarButtonItem alloc]initWithCustomView:ButRight];
    self.navigationItem.rightBarButtonItem=BtnRighttem;
    /**
     * 创建搜索框，可以检索你的所有的内容！
     */
    UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(w*0.05, 64, w*0.85, h/11)];
    [self.view addSubview:searchField];
    searchField.placeholder=@"你想搜索什么？";
    //searchField.delegate = self;

    /**
     *  创建搜索框上线的 搜索按钮
     */
    UIButton *searchBtn = [[UIButton alloc ]initWithFrame:CGRectMake(w*0.8, 64, w*0.25, h/11)];
    //searchBtn.backgroundColor = [UIColor brownColor];
    [self.view addSubview: searchBtn];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    NSLog(@"≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈%f",h/11);
    /**
     *  创建右下角的添加btuton
     *
     *  @return butt0n
     */
    
    UIButton *addBtn = [[UIButton alloc ]initWithFrame:CGRectMake(w*0.8, h-60, 61, 61)];
    //addBtn.backgroundColor = [UIColor brownColor];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    UIImage *image =[UIImage imageNamed:@"add"];
    [addBtn setImage:image forState:UIControlStateNormal];
    addBtn.tag = 999;
    [[[[UIApplication sharedApplication]delegate]window] addSubview: addBtn];
    [addBtn addTarget:self action:@selector(addTextClick:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNotificationtwo:) name:@"theAllAddText" object:nil];
    /**
     *  创建 collocationView
     *
     *  @return o
     */
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(w/2-30, w/2-10);
    layout.minimumLineSpacing=5;
    layout.minimumInteritemSpacing=5;
    
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, h/5, w-30, h*0.7) collectionViewLayout:layout];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    myCollectionView.alpha = 0.7;
    //myCollectionView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:myCollectionView];
    
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataSourse.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lab = [cell viewWithTag:8];
  
    if (lab==nil) {
        lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame))];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.tag = 8;
        [cell addSubview:lab];
//        UIButton *newBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame))];
//        newBtn.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
////        [newBtn addTarget:self action:@selector(newbtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        newBtn.tag = 100+indexPath.row;
//          [cell addSubview:newBtn];
      lab.backgroundColor = [UIColor colorWithRed:1+arc4random()%256/256.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        
    }
    
    UILabel *dlab = [cell viewWithTag:8];
    dlab.backgroundColor = [UIColor colorWithRed:1+arc4random()%256/256.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    dlab.numberOfLines=0;
    dlab.text=dataSourse[indexPath.row];
    //dlab.text =dataSourse[indexPath.row==1];
    
//    
//    UIButton *btn = [cell viewWithTag:101];
//    [btn setTitle:dataSourse[indexPath.row==1] forState:normal];
//  
  
    //cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.row);
    detialViewController *detialVC = [[detialViewController alloc]init];
    /**
     *  通过属性传值，将文本全部传递过去
     */
    detialVC.textString = dataSourse[indexPath.row];
    moreDetialViewController *vc = [[moreDetialViewController alloc]init];
    [self.navigationController pushViewController:detialVC animated:YES];
   
}

- (void)leftBtnClick:(UIButton *)btn{
  //  btn.alpha = 0;
    NSLog(@"你点得到么？");
    /**
      跳转至 moreDetial的页面
     */
    moreDetialViewController *moreVC = [[moreDetialViewController alloc]init];
    [self.navigationController pushViewController:moreVC animated:YES];
    
}
- (void)rightBtnClick{
  
    NSLog(@"改变tableView的视图形状");
}
- (void)addTextClick:(UIButton *)btn{
    /**
     跳转至addText的界面
     */
    addTextViewController *vc = [[addTextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    btn.alpha = 0;
}
- (void)getNotificationtwo:(NSNotification *)notification{
    NSDictionary *dic=notification.userInfo;
    
//    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, h*0.9)];
    //textLab.text = dic[@"便签"];
    [dataSourse addObject:dic[@"便签"]];
    //textLab.backgroundColor = [UIColor redColor];
//    textLab.numberOfLines = 0;
//    [self.view addSubview:textLab];
//    
//    UILabel *clab = [myCollectionView viewWithTag:8];
//    clab.text = dic[@"便签"];
//    NSLog(@"收到通知2了 数据为 %@",dic);
    
    [myCollectionView reloadData];
    UIButton *btn = [[[[UIApplication sharedApplication]delegate]window] viewWithTag:999];
    btn.alpha = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
