//
//  SearchViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "SearchViewController.h"
#import "PyViewController.h"
#import "BsViewController.h"
#import "MoreChoicesViewController.h"

@interface SearchViewController ()
{
    NSInteger index;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_segmentCon setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [_segmentCon setBackgroundImage:[UIImage imageNamed:@"pyjz_normal"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //导航栏颜色
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:41/255.0 alpha:0];
    
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    [_pyView setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:0.1]];
    
    [_BsView setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:0.1]];
    
    //设置title的字体
    
    NSDictionary *textDic=@{NSFontAttributeName:[UIFont systemFontOfSize:30],NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.titleTextAttributes=textDic;
    
    _pyView.hidden=NO;
    _BsView.hidden=YES;

    
    
}

- (IBAction)valueChanged:(id)sender {
    switch (_segmentCon.selectedSegmentIndex) {
        case 0:
            _pyView.hidden=NO;
            _BsView.hidden=YES;
            
            
            break;
        case 1:
            _pyView.hidden=YES;
            _BsView.hidden=NO;
        default:
            break;
    }
}

- (IBAction)pushpyAction:(UIButton *)sender {
    
    UIStoryboard *mainSB=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    PyViewController *pvc=[mainSB instantiateViewControllerWithIdentifier:@"123"];
    
    
    
    index=sender.tag-101;
    pvc.toIndex=index;
    [self.navigationController pushViewController:pvc animated:YES];
    
    
}

- (IBAction)pushbsAction:(UIButton *)sender {
    UIStoryboard *mainSB=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    BsViewController *bvc=[mainSB instantiateViewControllerWithIdentifier:@"234"];
    index=sender.tag-201;
    bvc.toIndex = index;
    NSLog(@"index = %ld",index);
    [self.navigationController pushViewController:bvc animated:YES];
    
    
    
}


- (IBAction)pushmAction:(id)sender {
    UIStoryboard *mainSB=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    MoreChoicesViewController *mvc=[mainSB instantiateViewControllerWithIdentifier:@"345"];
    [self.navigationController pushViewController:mvc animated:YES];
}






-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
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
