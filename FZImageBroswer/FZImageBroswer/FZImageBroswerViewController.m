//
//  FZImageBroswerViewController.m
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/14.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import "FZImageBroswerViewController.h"

@interface FZImageBroswerViewController ()
{
    UIScrollView *_bottomScrollView;
}
@end

@implementation FZImageBroswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTapGes];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    [self openAnimation];

}


- (void)openAnimation{
    
    CGRect frame = [self.broswerView frameOfIndex:self.imageIndex];
    
    CGPoint p = [self.broswerView convertPoint:frame.origin toView:self.broswerView.window];
    
    frame.origin.x = p.x;
    frame.origin.y = p.y;
    
    UIImageView* imageV = [[UIImageView alloc]initWithFrame:frame];
    
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *imageViewTemp = self.imageViewArr[self.imageIndex];
    
    imageV.image = imageViewTemp.image;
    
    [self.view addSubview:imageV];
    
    
    [UIView animateWithDuration:.35 animations:^{
        
        imageV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [self loadScrollView];
        
        [imageV removeFromSuperview];
        
    }];


}
- (void)loadScrollView{
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;

    _bottomScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    _bottomScrollView.pagingEnabled = YES;
    
    _bottomScrollView.delegate = self;
    
    _bottomScrollView.contentSize = CGSizeMake(_imageViewArr.count*width, height);
    
    for (int i=0; i<_imageViewArr.count; i++) {
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
        
        scrollView.delegate = self;
        
        scrollView.maximumZoomScale = 2.0f;
        
        scrollView.minimumZoomScale = 1.0f;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        imageView.tag = 111;
        
        UIImageView *imageViewTemp = (UIImageView*)_imageViewArr[i];
        
        imageView.image = imageViewTemp.image;
        
        [scrollView addSubview:imageView];
        
        
        [_bottomScrollView addSubview:scrollView];
    }
    
    [self.view insertSubview:_bottomScrollView atIndex:0];
    
    [_bottomScrollView scrollRectToVisible:CGRectMake(self.imageIndex*width, 0, width, height) animated:NO];
    
    
    


}
- (void)dismissVC{
    
    CGRect frame = [self.broswerView frameOfIndex:self.imageIndex];
    
    UIImageView *imageView = self.imageViewArr[self.imageIndex];
    
     CGPoint point = [self.view.window convertPoint:CGPointMake(0, 0)  toView:self.broswerView];
    
    
    imageView.frame = CGRectMake(point.x, point.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self dismissViewControllerAnimated:NO completion:^{
        
        
        [UIView animateWithDuration:.35f animations:^{
            
            imageView.frame = frame;
            
        }];
        
    }];


   

}
//MARK: TAP
- (void)addTapGes{
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesAction:)];
    
    
    [self.view addGestureRecognizer:tapGes];
    
    
    
}
- (void)tapGesAction:(UITapGestureRecognizer*)ges{
    
    [self dismissVC];
    
}
//MARK: SCROLL
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView!=_bottomScrollView) {
        
        return;
    }
    
    self.imageIndex = scrollView.contentOffset.x/scrollView.frame.size.width ;
    

}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    
    return [scrollView viewWithTag:111];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
