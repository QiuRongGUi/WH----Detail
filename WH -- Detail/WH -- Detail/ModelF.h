//
//  ModelF.h
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/7/1.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Model;

@interface ModelF : NSObject
/** <#class#>*/
@property(nonatomic,assign) CGRect iconF;
/** <#class#>*/
@property(nonatomic,assign) CGRect contentF;

@property(nonatomic,assign) CGRect imageDataF;



/** <#class#>*/
@property(nonatomic,strong) Model *mod;

@property(nonatomic,assign) CGFloat H;


@end
