//
//  MoreChoicesViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/21.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "MoreChoicesViewController.h"
#import "MoreTableViewCell.h"
#import "feedbackViewController.h"
@interface MoreChoicesViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arr;
}
@end

@implementation MoreChoicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgview=[[UIImageView alloc]initWithFrame:self.view.frame];
    bgview.image=[UIImage imageNamed:@"beijing"];
    [self.view addSubview:bgview];
    UITableView * mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    mTableView.dataSource=self;
    mTableView.delegate=self;
    [self.view addSubview:mTableView];
    arr=@[@"我的收藏",@"分享",@"意见反馈",@"精品应用",@"应用打分",@"关于我们"];
    
    [mTableView registerNib:[UINib nibWithNibName:@"MoreTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MoreTableViewCell class])];
    mTableView.rowHeight=80;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    mTableView.backgroundColor=[UIColor clearColor];
    
    UIBarButtonItem *leftBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    self.title=@"汉语字典";
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 2:{
            FeedBackViewController *fvc=[[FeedBackViewController alloc]initWithNibName:@"FeedBackViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:fvc animated:YES];
        }
            break;
            
        default:
            break;
    }
}



-(void)backAction:(id )sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreTableViewCell *cell=(MoreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MoreTableViewCell class])];
    cell.nameLabel.text=arr[indexPath.row];
    cell.markImage.image=[UIImage imageNamed:@"continue"];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
