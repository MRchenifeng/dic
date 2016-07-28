//
//  PyViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "PyViewController.h"
#import "PinyinModel.h"
#import <sqlite3.h>
#import "PyDecViewController.h"
@interface PyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *pinyins;
    NSMutableArray *allUpper;
    NSMutableArray *aArr;
    NSMutableArray *bArr;
    NSMutableArray *cArr;
    NSMutableArray *dArr;
    NSMutableArray *eArr;
    NSMutableArray *fArr;
    NSMutableArray *gArr;
    NSMutableArray *hArr;
    NSMutableArray *iArr;
    NSMutableArray *jArr;
    NSMutableArray *kArr;
    NSMutableArray *lArr;
    NSMutableArray *mArr;
    NSMutableArray *nArr;
    NSMutableArray *oArr;
    NSMutableArray *pArr;
    NSMutableArray *qArr;
    NSMutableArray *rArr;
    NSMutableArray *sArr;
    NSMutableArray *tArr;
    NSMutableArray *uArr;
    NSMutableArray *vArr;
    NSMutableArray *wArr;
    NSMutableArray *xArr;
    NSMutableArray *yArr;
    NSMutableArray *zArr;
    
    NSMutableArray *allArr;
    
    NSString * upper;
    
    
    
}
@end

@implementation PyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
//    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
//    NSLog(@"%@",path);
    
    
    NSArray *arr   =[self findAll];
    allUpper=[NSMutableArray array];
    
    aArr=[NSMutableArray array];
    bArr=[NSMutableArray array];
    cArr=[NSMutableArray array];
    dArr=[NSMutableArray array];
    eArr=[NSMutableArray array];
    fArr=[NSMutableArray array];
    gArr=[NSMutableArray array];
    hArr=[NSMutableArray array];
    iArr=[NSMutableArray array];
    jArr=[NSMutableArray array];
    kArr=[NSMutableArray array];
    lArr=[NSMutableArray array];
    mArr=[NSMutableArray array];
    nArr=[NSMutableArray array];
    oArr=[NSMutableArray array];
    pArr=[NSMutableArray array];
    qArr=[NSMutableArray array];
    rArr=[NSMutableArray array];
    sArr=[NSMutableArray array];
    tArr=[NSMutableArray array];
    uArr=[NSMutableArray array];
    vArr=[NSMutableArray array];
    wArr=[NSMutableArray array];
    xArr=[NSMutableArray array];
    yArr=[NSMutableArray array];
    zArr=[NSMutableArray array];
    
    allArr=[NSMutableArray array];
    for(int i=26;i<arr.count;i++){
        PinyinModel*pym=arr[i];
        NSString *name=pym.pyName;
//        NSLog(@"name=%@",name);
        
        if([name hasPrefix:@"a"]){
            
            [aArr addObject:name];
            
        }if([name hasPrefix:@"b"]){
            [bArr addObject:name];
        }if([name hasPrefix:@"c"]){
            [cArr addObject:name];
        }if([name hasPrefix:@"d"]){
            [dArr addObject:name];
        }if([name hasPrefix:@"e"]){
            [eArr addObject:name];
        }if([name hasPrefix:@"f"]){
            [fArr addObject:name];
        }if([name hasPrefix:@"g"]){
            [gArr addObject:name];
        }if([name hasPrefix:@"h"]){
            [hArr addObject:name];
        }if([name hasPrefix:@"i"]){
            [iArr addObject:name];
        }if([name hasPrefix:@"j"]){
            [jArr addObject:name];
        }if([name hasPrefix:@"k"]){
            [kArr addObject:name];
        }if([name hasPrefix:@"l"]){
            [lArr addObject:name];
        }if([name hasPrefix:@"m"]){
            [mArr addObject:name];
        }if([name hasPrefix:@"n"]){
            [nArr addObject:name];
        }if([name hasPrefix:@"o"]){
            [oArr addObject:name];
        }if([name hasPrefix:@"p"]){
            [pArr addObject:name];
        }if([name hasPrefix:@"q"]){
            [qArr addObject:name];
        }if([name hasPrefix:@"r"]){
            [rArr addObject:name];
        }if([name hasPrefix:@"s"]){
            [sArr addObject:name];
        }if([name hasPrefix:@"t"]){
            [tArr addObject:name];
        }if([name hasPrefix:@"u"]){
            [uArr addObject:name];
        }if([name hasPrefix:@"v"]){
            [vArr addObject:name];
        }if([name hasPrefix:@"w"]){
            [wArr addObject:name];
        }if([name hasPrefix:@"x"]){
            [xArr addObject:name];
        }if([name hasPrefix:@"y"]){
            [yArr addObject:name];
        }if([name hasPrefix:@"z"]){
            [zArr addObject:name];
        }



        
    }
    
    
    [allArr addObject:aArr];
    [allArr addObject:bArr];
    [allArr addObject:cArr];
    [allArr addObject:dArr];
    [allArr addObject:eArr];
    [allArr addObject:fArr];
    [allArr addObject:gArr];
    [allArr addObject:hArr];
    [allArr addObject:iArr];
    [allArr addObject:jArr];
    [allArr addObject:kArr];
    [allArr addObject:lArr];
    [allArr addObject:mArr];
    [allArr addObject:nArr];
    [allArr addObject:oArr];
    [allArr addObject:pArr];
    [allArr addObject:qArr];
    [allArr addObject:rArr];
    [allArr addObject:sArr];
    [allArr addObject:tArr];
    [allArr addObject:uArr];
    [allArr addObject:vArr];
    [allArr addObject:wArr];
    [allArr addObject:xArr];
    [allArr addObject:yArr];
    [allArr addObject:zArr];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _pytableView.sectionIndexBackgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame3"]];
    
    [_pytableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.toIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

-(NSArray *)findAll{
    pinyins=[NSMutableArray array];
    NSString *dbpath=[[NSBundle mainBundle]pathForResource:@"aaaaa2" ofType:@"sqlite"];
    sqlite3 *db;
    sqlite3_open(dbpath.UTF8String,&db);
    NSString *sql=@"select *from ol_pinyins";
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(db,sql.UTF8String,-1,&stmt,NULL)==SQLITE_OK){
        while(sqlite3_step(stmt)==SQLITE_ROW){
            PinyinModel *pym=[PinyinModel new];
            pym.pinyinID=sqlite3_column_int(stmt,0);
            pym.pyName=[NSString stringWithCString:(char *)sqlite3_column_text(stmt,1) encoding:4];
            [pinyins addObject:pym];
        }
    }
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    return pinyins;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array=allArr[section];
    
    return array.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return allArr.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==8 ){
        return [NSString stringWithFormat:@"I"];
    }else if (section==20){
        return [NSString stringWithFormat:@"U"];
    }else if (section==21){
        return [NSString stringWithFormat:@"V"];
    }else{
        upper=[[allArr[section][0]uppercaseString]substringToIndex:1];
        return upper;
    }
    
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    allUpper=[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
//    NSLog(@"%@",allUpper);
    return allUpper;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"py"];
    NSArray *array=allArr[indexPath.section];
    cell.textLabel.text=array[indexPath.row];
    return cell;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array=allArr[indexPath.section];
    self.pyUpper=array[indexPath.row];
    
    UIStoryboard *SB=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    PyDecViewController *pvc=[SB instantiateViewControllerWithIdentifier:@"678"];
    pvc.toPyupper=self.pyUpper;
    [self.navigationController pushViewController:pvc animated:YES];
    
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
