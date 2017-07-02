//
//  TableViewCell.m
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/7/2.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"

#import "PhotosView.h"
#import "ModelF.h"
#import "Model.h"

@interface TableViewCell ()
/** <#class#>*/
@property(nonatomic,strong) UIImageView *icon;
/** <#class#>*/
@property(nonatomic,strong) UILabel *content;


/** <#class#>*/
@property(nonatomic,strong) PhotosView *photosView;

@end

@implementation TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UILabel *al = [[UILabel alloc] init];
        al.font = [UIFont systemFontOfSize:15];
        al.numberOfLines = 0;
        self.content = al;
        [self.contentView addSubview:al];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        self.icon = imageView;
        [self.contentView addSubview:imageView];
        
        PhotosView *view = [[PhotosView alloc] init];
        self.photosView = view;
        view.backgroundColor = [UIColor redColor];

        [self.contentView addSubview:view];
        
        self.icon.backgroundColor = [UIColor orangeColor];
        self.content.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}

- (void)setModf:(ModelF *)modf{
    
    _modf = modf;
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:modf.mod.icon] placeholderImage:nil];
    
    self.content.text  = modf.mod.content;
    if(modf.mod.imageData.count){
        
        self.photosView.hidden = NO;
        self.photosView.photosData = modf.mod.imageData;
        self.photosView.frame = modf.imageDataF;
    }else {
        
        self.photosView.hidden = YES;
    }
    
    self.icon.frame = modf.iconF;
    self.content.frame = modf.contentF;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
