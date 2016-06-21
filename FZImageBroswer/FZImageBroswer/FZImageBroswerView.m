//
//  FZImageBroswerView.m
//  FZImageBroswer
//
//  Created by 谢方振 on 16/6/13.
//  Copyright © 2016年 谢方振. All rights reserved.
//

#import "FZImageBroswerView.h"
#import "FZImageBroswerItem.h"
@interface FZImageBroswerView()
{

    UIScrollView *_imageContainerScroll;
    
    CGFloat _imageWidth;
    
    NSMutableArray *imageViewArr;//存放加载完成的图片
}
@end

@implementation FZImageBroswerView

-(instancetype)initWithFrame:(CGRect)frame andNumber:(NSInteger)imageNumber{

    if (self = [super initWithFrame:frame]) {
        
        _imageWidth = [self configWidth:imageNumber];
        
        imageViewArr = [NSMutableArray arrayWithCapacity:1];
        
        
        
    }
    
    return self;

}

-(void)setImageList:(NSArray *)imageList{

    if (_imageList == imageList) {
        return;
    }
    _imageList = imageList;
    
    [self createUI];
    
    

}

-(CGFloat)configWidth:(NSInteger)imageNumber{

    NSInteger numberOfSpace = imageNumber+1;
    
    return (self.frame.size.width-space*numberOfSpace)/(imageNumber);

}



- (CGRect)frameOfIndex:(NSInteger)index{

    CGRect frame = CGRectMake(index*_imageWidth+(index+1)*space, space, _imageWidth, _imageWidth);
    
    return frame;

}

- (void)createUI{
    
    
    _imageContainerScroll = [[UIScrollView alloc]initWithFrame:self.bounds];
    
    for (int i=0;i<_imageList.count;i++) {
        
        FZImageBroswerItem *imageView = [[FZImageBroswerItem alloc]initWithFrame:[self frameOfIndex:i]];
        
        [imageViewArr addObject:imageView];
        
        __weak typeof(self) weakSelf = self;
        
        [imageView setItemBlock:^(){
            
            FZImageBroswerViewController *vc = [[FZImageBroswerViewController alloc]init];
            
            vc.imageViewArr = imageViewArr;
            
            vc.imageIndex = i;
            
            vc.broswerView = self;
            
            
            [[weakSelf viewController] presentViewController:vc animated:NO completion:^{
                
            }];
            
            [weakSelf bringCellToFront];
            
        
        }];
        
        NSURL *imageUrl = [NSURL URLWithString:_imageList[i]];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            
            UIImage * image = [[UIImage alloc]initWithData:imageData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                imageView.image = image;
                
            });
            
        });
        
        
        
        
        _imageContainerScroll.contentSize = CGSizeMake((space+imageView.frame.size.width)*_imageList.count,space);
        
        
        [_imageContainerScroll addSubview:imageView];
        
    }
    [self addSubview:_imageContainerScroll];
    

}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
-(void)bringCellToFront{
    
    
    UIResponder *next = self.nextResponder;
    
    while (next) {
        

        
        if ([next isKindOfClass:[UITableViewCell class]]) {
            
            [[(UITableViewCell*)next superview] bringSubviewToFront:next];
            
        }
        
        next = next.nextResponder;
        
    }
    
    
}
@end
