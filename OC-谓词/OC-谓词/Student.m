//
//  Student.m
//  OC-谓词
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Student.h"

@implementation Student
-(instancetype)initWithName:(NSString *)name andAge:(int)age
{
    if (self=[super init])
    {
        _name=name;
        _age=age;
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@,%d,%g",_name,_age,_height];
}
@end
