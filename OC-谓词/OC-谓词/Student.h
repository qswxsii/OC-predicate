//
//  Student.h
//  OC-谓词
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(copy,nonatomic)NSString *name;
@property(assign,nonatomic)int age;
@property(assign,nonatomic)double height;
-(instancetype)initWithName:(NSString *)name andAge:(int)age;
@end
