//
//  PhotosView.m
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/7/2.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "PhotosView.h"
#import "UIView+JKFrame.h"
#import "SDPhotoBrowser.h"
#import "UIImageView+WebCache.h"

#define photosMaxCol(count) ((count == 4)?2:3)
#define WidthH (([UIScreen mainScreen].bounds.size.width - 50) / 3)

@interface PhotosView ()<SDPhotoBrowserDelegate>{
    
}

@end
@implementation PhotosView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
                
            
    }
    
    return self;
}

- (void)setPhotosData:(NSArray *)photosData{
    
    _photosData = photosData;
    
    while (self.subviews.count < photosData.count) {
        
        UIImageView *aImageView = [UIImageView new];
        aImageView.userInteractionEnabled = YES;
        aImageView.backgroundColor = [UIColor orangeColor];
        [self addSubview:aImageView];
    }
    
    for(int i = 0;i<self.subviews.count;i++){
        
        UIImageView *imageView = self.subviews[i];
        if(i < photosData.count){
            [imageView sd_setImageWithURL:[NSURL URLWithString:photosData[i]] placeholderImage:nil];

            imageView.hidden = NO;
        }else{
            imageView.hidden = YES;
            
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clike:)];
        [imageView addGestureRecognizer:tap];

    }
}

+ (CGSize)returnSizeWithPhotosCount:(NSInteger)count{
        
    NSInteger  row = (count + photosMaxCol(count) - 1)/photosMaxCol(count);
    NSInteger  col = count > photosMaxCol(count)?photosMaxCol(count):count;
    
    return CGSizeMake(col * WidthH + (col - 1) * 10, row * WidthH + (row - 1) * 10);

    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    for(int i = 0;i<self.photosData.count;i++){
        
        UIImageView *aImageVeiw = self.subviews[i];
        
        aImageVeiw.jk_left = (WidthH + 10) * (i % photosMaxCol(self.photosData.count));
        aImageVeiw.jk_top = (WidthH + 10) * (i / photosMaxCol(self.photosData.count));
        aImageVeiw.jk_width = WidthH;
        aImageVeiw.jk_height = WidthH;
        
    }
}
#pragma mark - SDPhotoBrowserDelegate
- (void)clike:(UITapGestureRecognizer *)tap{
    
    UIView *imageView = tap.view;
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = imageView.tag;
    browser.sourceImagesContainerView = self;
    browser.imageCount = self.photosData.count;
    browser.delegate = self;
    [browser show];
    
    
}

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *imageName = self.photosData[index];
    NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:nil];
    return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.subviews[index];
    return imageView.image;
}

@end
