//
//  PyDecViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/25.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "PyDecViewController.h"
#import "PydTableViewCell.h"
#import "PinyinModel.h"
@interface PyDecViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataSource;
    UITableView *pyTableView;
    
    int index;
    
}
@end

@implementation PyDecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    index=1;
    
    NSLog(@"%@",_toPyupper);
    
    pyTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    pyTableView.delegate=self;
    pyTableView.dataSource=self;
    [self.view addSubview:pyTableView];
    [self.view addSubview:_refreshBtn];
    
    
    
    [pyTableView registerNib:[UINib nibWithNibName:@"PydTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([PydTableViewCell class])];
    
    pyTableView.rowHeight=80;
    [self initjsondata];
    
    self.title=self.toPyupper;
}

-(void)initjsondata{
    dataSource=[NSMutableArray array];
    
    NSString *url=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/2",_toPyupper];
    
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
    
   NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           NSError *error1;
           NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
           NSDictionary *statesDic=dic[@"data"];
       NSArray *statesArr=statesDic[@"words"];
       
       
       for (NSDictionary *statesDic1 in statesArr) {
           
           PinyinModel *pym=[PinyinModel new];
           
           pym.name=statesDic1[@"simp"];
           pym.pinyin=statesDic1[@"yin"][@"pinyin"];
           pym.bushou=statesDic1[@"bushou"];
           pym.bihua=statesDic1[@"num"];
           [dataSource addObject:pym];
       }
        dispatch_sync(dispatch_get_main_queue(), ^{
            [pyTableView reloadData];
        });
       
       
       
        
    }];
    [dataTask resume];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"datasource.count=%ld",dataSource.count);
    
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PydTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PydTableViewCell class])];
    
    PinyinModel *pym=dataSource[indexPath.row];
        cell.wordLabel.text=pym.name;
        cell.pinyin.text=pym.pinyin;
        cell.bushou.text=pym.bushou;
        cell.bihua.text=pym.bihua;

    
   
    return cell;
    
}




- (IBAction)refreshAction:(id)sender {
    
    index=2*index;
    NSString *url=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/%@/2",_toPyupper,[NSNumber numberWithInt:index]];
    
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *error1;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
        NSDictionary *statesDic=dic[@"data"];
        NSArray *statesArr=statesDic[@"words"];
        for (NSDictionary *statesDic1 in statesArr) {
            PinyinModel *pym=[PinyinModel new];
            pym.name=statesDic1[@"simp"];
            pym.pinyin=statesDic1[@"yin"][@"pinyin"];
            pym.bushou=statesDic1[@"bushou"];
            pym.bihua=statesDic1[@"num"];
            [dataSource addObject:pym];
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            [pyTableView reloadData];
        });
        
        
        
        
    }];
    [dataTask resume];

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
