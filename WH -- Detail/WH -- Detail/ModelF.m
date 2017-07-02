//
//  ModelF.m
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/7/1.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "ModelF.h"
#import "Model.h"
#import "PhotosView.h"

@implementation ModelF

- (void)setMod:(Model *)mod{
    
    _mod = mod;
    
    self.iconF = CGRectMake(5, 5, 40, 40);
    
    CGSize size = [mod.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 300) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    self.contentF = CGRectMake(5, CGRectGetMaxY(self.iconF), size.width, size.height);
    
    if(mod.imageData.count){
        
        CGSize size = [PhotosView returnSizeWithPhotosCount:mod.imageData.count];
        self.imageDataF = CGRectMake(5, CGRectGetMaxY(self.contentF), size.width, size.height);
        
        self.H = CGRectGetMaxY(self.imageDataF) + 5;
    }else{
        self.H = CGRectGetMaxY(self.contentF) + 5;
    }
    
    
}
@end
