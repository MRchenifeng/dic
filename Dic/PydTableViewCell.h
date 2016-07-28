//
//  PydTableViewCell.h
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/25.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechSynthesizer.h"
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"
@interface PydTableViewCell : UITableViewCell<IFlySpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinyin;

@property (weak, nonatomic) IBOutlet UILabel *bushou;

@property (weak, nonatomic) IBOutlet UILabel *bihua;


@end
