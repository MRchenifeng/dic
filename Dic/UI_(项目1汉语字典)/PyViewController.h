//
//  PyViewController.h
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *pytableView;
@property(assign,nonatomic)NSInteger toIndex;
@property(nonatomic,copy)NSString *pyUpper;
@end
