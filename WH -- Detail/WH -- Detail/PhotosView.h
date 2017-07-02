//
//  PhotosView.h
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/7/2.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosView : UIView

/** <#class#>*/
@property(nonatomic,strong) NSArray *photosData;

+ (CGSize)returnSizeWithPhotosCount:(NSInteger)count;

@end
