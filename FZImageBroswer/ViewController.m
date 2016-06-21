//
//  ViewController.m
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/13.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import "ViewController.h"
#import "FZImageBroswerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // @http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png
    
    FZImageBroswerView *broswerView = [[FZImageBroswerView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100) andNumber:5];
    
    broswerView.imageList = @[@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png",@"http://o7d7kluuw.bkt.clouddn.com/20160516%20sandbox5.png"];
    
    [self.view addSubview:broswerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
