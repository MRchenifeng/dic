//
//  ViewController.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    proValue=0;
//    _startBtn.enabled=NO;
//    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
}

-(void)changeProgress
{
    proValue+=1.0;
    
    
    
    if(proValue>5)
    {
        _startBtn.enabled=YES;
        [timer invalidate];
        
    }else{
        [_progressView setProgress:proValue/5];
        _pvLabel.text=[NSString stringWithFormat:@"%.2f",proValue];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
