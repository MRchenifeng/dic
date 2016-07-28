//
//  FeedBackViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/22.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bgImage.image=[UIImage imageNamed:@"beijing"];
    _bgImage.backgroundColor = [UIColor clearColor];
    _betImageView.image=[UIImage imageNamed:@"fankuikuang"];
    _fdTV.backgroundColor=[UIColor clearColor];
    _fdTV.text=@"请输入你的反馈意见...";
    tableArray=@[@"7~15岁",@"15~20岁",@"20岁以上"];
    sexArray1=@[@"男",@"女"];
    
    UIBarButtonItem *rightBBI=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"magnifier"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.rightBarButtonItem=rightBBI;
   
    self.title=@"意见反馈";
    
    
    
    _tableView2.delegate=self;
    _tableView2.dataSource=self;
    _tableView2.hidden=YES;
    
    _tableView1.delegate=self;
    _tableView1.dataSource=self;
    
    
    [_ageBtn addTarget:self action:@selector(showTv) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)backAction:(UIBarButtonItem *)sender{
    
}



-(void)showTv{
    _tableView2.hidden=!_tableView2.hidden;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==_tableView2){
    switch (indexPath.row) {
        case 0:
            _ageL.text=@"12岁";
            break;
            case 1:
            _ageL.text=@"18岁";
            break;
        case 2:
            _ageL.text=@"25岁以上";
            break;
        default:
            break;
    }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==_tableView2 ){
    return tableArray.count;
    }else{
        return sexArray1.count;
    }
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==_tableView2){
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nianling"];
    cell.textLabel.text=tableArray[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:6];
    
    return cell;
    }else{
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sex"];
        cell.textLabel.text=sexArray1[indexPath.row];
        cell.textLabel.font=[UIFont systemFontOfSize:6];
        return cell;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
