//
//  FeedBackViewController.h
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/22.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
        NSArray *tableArray;
    NSArray *sexArray1;
    BOOL showList;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UITextView *fdTV;
@property (weak, nonatomic) IBOutlet UIImageView *betImageView;

@property (weak, nonatomic) IBOutlet UITableView *tableView2;

@property (weak, nonatomic) IBOutlet UIButton *ageBtn;

@property (weak, nonatomic) IBOutlet UILabel *ageL;

@property (weak, nonatomic) IBOutlet UITableView *tableView1;


@end
