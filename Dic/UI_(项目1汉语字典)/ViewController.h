//
//  ViewController.h
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    double proValue;
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *pvLabel;

@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@end

