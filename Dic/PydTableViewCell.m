//
//  PydTableViewCell.m
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/25.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import "PydTableViewCell.h"




@implementation PydTableViewCell
{
    IFlySpeechSynthesizer * _iFlySpeechSynthesizer; }

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)soundAction:(UIButton *)sender {
    
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance]; _iFlySpeechSynthesizer.delegate =
    self;
    //2.设置合成参数
    //设置在线工作方式
    [_iFlySpeechSynthesizer setParameter:[IFlySpeechConstant TYPE_CLOUD]
                                  forKey:[IFlySpeechConstant ENGINE_TYPE]];
    //音量,取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"100" forKey: [IFlySpeechConstant VOLUME]];
    
    [_iFlySpeechSynthesizer setParameter:@"10" forKey:[IFlySpeechConstant SPEED]];
    //发音人,默认为”xiaoyan”,可以设置的参数列表可参考“合成发音人列表” [_iFlySpeechSynthesizer setParameter:@" xiaoyan " forKey: [IFlySpeechConstant VOICE_NAME]]; //保存合成文件名,如不再需要,设置设置为nil或者为空表示取消,默认目录位于 library/cache下
    [_iFlySpeechSynthesizer setParameter:@" tts.pcm" forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
    //3.启动合成会话
    [_iFlySpeechSynthesizer startSpeaking: _wordLabel.text];

    

    
}

//4.IFlySpeechSynthesizerDelegate 实现代理
//结束代理
- (void) onCompleted:(IFlySpeechError *) error{}
//合成开始
- (void) onSpeakBegin{}
//合成缓冲进度
- (void) onBufferProgress:(int) progress message:(NSString *)msg{} //合成播放进度
- (void) onSpeakProgress:(int) progress{}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
