//
//  FZImageBroswerView.h
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/13.
//  Copyright © 2016年 谢方振. All rights reserved.
//
#define space 10
#import <UIKit/UIKit.h>

@interface FZImageBroswerView : UIView
@property(nonatomic,strong)NSArray *imageList;
-(instancetype)initWithFrame:(CGRect)frame andNumber:(NSInteger)imageNumber;
- (CGRect)frameOfIndex:(NSInteger)index;
@end
