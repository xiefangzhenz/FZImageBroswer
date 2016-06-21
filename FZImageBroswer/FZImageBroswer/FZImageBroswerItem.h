//
//  FZImageBroswerItem.h
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/13.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZImageBroswerViewController.h"
typedef void(^ImageBroswerItemBlock)();
@interface FZImageBroswerItem : UIImageView
@property(nonatomic,copy)ImageBroswerItemBlock itemBlock;
@end
