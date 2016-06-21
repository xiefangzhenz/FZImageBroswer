//
//  FZImageBroswerItem.m
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/13.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import "FZImageBroswerItem.h"

@implementation FZImageBroswerItem

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.contentMode = UIViewContentModeScaleToFill;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        tap.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:tap];
        
        
    }
    
    return self;

}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    if (self.itemBlock) {
        
        self.itemBlock();
    }
    
}



@end
