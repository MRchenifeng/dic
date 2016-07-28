//
//  PinyinModel.h
//  UI_(项目1汉语字典)
//
//  Created by administrator on 16/7/18.
//  Copyright © 2016年 ibakan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinyinModel : NSObject
@property(nonatomic,assign)int pinyinID;
@property(nonatomic,copy)NSString *pyName;
//拼音详细描述

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pinyin;
@property(nonatomic,copy)NSString *bushou;
@property(nonatomic,copy)NSString *bihua;

@end
