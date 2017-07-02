//
//  ViewController.m
//  WH -- Demo9
//
//  Created by QIUGUI on 2017/6/29.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "ModelF.h"
#import "TableViewCell.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
/** <#class#>*/
@property(nonatomic,strong) NSMutableArray *modelsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    [self creatModelsWithCount:20];
    
}
- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    
    NSArray *iconImageNamesArray = @[@"http://img4.imgtn.bdimg.com/it/u=10603785,2005759777&fm=26&gp=0.jpg",
                                     @"http://exp.cdn-hotels.com/hotels/4000000/3900000/3893200/3893187/3893187_25_y.jpg",
                                     @"http://img1.imgtn.bdimg.com/it/u=4131634322,487666839&fm=26&gp=0.jpg",                                     @"http://img2.imgtn.bdimg.com/it/u=3777811091,2266901851&fm=26&gp=0.jpg",
                                     @"http://img1.imgtn.bdimg.com/it/u=2403926125,3653927506&fm=26&gp=0.jpg",
                                     @"http://img3.imgtn.bdimg.com/it/u=2489051743,1646771720&fm=26&gp=0.jpg",
                                     @"http://img4.imgtn.bdimg.com/it/u=10603785,2005759777&fm=26&gp=0.jpg",
                                     @"http://exp.cdn-hotels.com/hotels/4000000/3900000/3893200/3893187/3893187_25_y.jpg",
                                     @"http://img1.imgtn.bdimg.com/it/u=4131634322,487666839&fm=26&gp=0.jpg"
                                     ];
    
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                           @"长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。"
                           ];
    
    if(arc4random_uniform(8) < 7){
        
        for(int i = 0;i<count;i++){
            
            Model *mod = [[Model alloc] init];
            mod.icon = iconImageNamesArray[arc4random_uniform(9)];
            mod.content = textArray[arc4random_uniform(4)];
            NSMutableArray *temp = [NSMutableArray array];
            
            
            
            for(int i = 0; i < arc4random_uniform(8);i++){
                
                [temp addObject:iconImageNamesArray[arc4random_uniform(8)]];
            }
            mod.imageData = [temp copy];
            
            ModelF *mf = [[ModelF alloc] init];
            mf.mod = mod;
            
            [self.modelsArray addObject:mf];
            
            
        }

    }
    
       
    
    [self.table reloadData];
    
    
    
 }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ModelF *m = self.modelsArray[indexPath.row];
    return m.H;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cell = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    
    if(!cell)
    {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    
    
    ModelF *mf = self.modelsArray[indexPath.row];
    cell.modf = mf;
    
    return  cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
