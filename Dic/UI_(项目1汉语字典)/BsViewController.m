//
//  BsViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/19.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "BsViewController.h"
#import  <sqlite3.h>
#import "BushouModel.h"
@interface BsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    
    NSMutableArray *bushous;
    NSMutableArray *allArr;
    NSArray *bharr;
}
@end

@implementation BsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    bharr=[NSArray arrayWithObjects:@"笔画一", @"笔画二",@"笔画三",@"笔画四",@"笔画五",@"笔画六",@"笔画七",@"笔画八",@"笔画九",@"笔画十",@"笔画十一",@"笔画十二",@"笔画十三",@"笔画十四",@"笔画十五",@"笔画十六",@"笔画十七",nil];
    
    NSArray *arr=[self findAll];
    NSLog(@"count=%ld",arr.count);
    NSMutableArray *bsArr=[NSMutableArray arrayWithArray:arr];
    
    NSArray *a2arr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17", nil];
    
    allArr = [NSMutableArray array];
    for (int i = 0; i < 17; i++) {
        NSMutableArray *arr = [NSMutableArray array];
        for (BushouModel *bs in bsArr) {
            if ([bs.bihuaNum isEqualToString:a2arr[i]]) {
                [arr addObject:bs];
            }
        }
        [allArr addObject:arr];
    }
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [_bsTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.toIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}


-(NSArray *)findAll{
    bushous=[NSMutableArray array];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"aaaaa2" ofType:@"sqlite"];
    
    sqlite3 *db;
    sqlite3_open(path.UTF8String,&db);
    NSString*sql=@"select * from ol_bushou";
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(db,sql.UTF8String,-1,&stmt,NULL)==SQLITE_OK){
        while(sqlite3_step(stmt)==SQLITE_ROW){
            BushouModel *bsm=[BushouModel new];
            bsm.bushouID=sqlite3_column_int(stmt,0);
            bsm.bihuaNum=[NSString stringWithCString:(char *)sqlite3_column_text(stmt,1) encoding:4];
            bsm.bihuaTitle=[NSString stringWithCString:(char *)sqlite3_column_text(stmt,2) encoding:4];
            [bushous addObject:bsm];
        }
    }
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    return bushous;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr=allArr[section];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"bs"];
    NSArray *arr=allArr[indexPath.section];
    BushouModel *bsm=arr[indexPath.row];
    cell.textLabel.text=bsm.bihuaTitle;
    NSLog(@"index=%ld",indexPath.section);
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return allArr.count;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return bharr[section];
    
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return bharr;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)didReceiveMemoryWarning {
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
