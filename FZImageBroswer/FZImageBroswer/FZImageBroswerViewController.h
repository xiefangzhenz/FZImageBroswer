//
//  FZImageBroswerViewController.h
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/14.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZImageBroswerView.h"
@interface FZImageBroswerViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *imageViewArr;
@property(nonatomic,assign)NSInteger imageIndex;
@property(nonatomic,assign)FZImageBroswerView *broswerView;
@end
