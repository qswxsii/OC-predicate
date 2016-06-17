//
//  main.m
//  OC-谓词
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr=@[@78,@58,@47,@89,@67];
        //创建谓词
        NSPredicate *pre1=[NSPredicate predicateWithFormat:@"SELF > 60"];
        //根据谓词进行筛选
        NSLog(@"及格:%@",[arr filteredArrayUsingPredicate:pre1]);//对arr1进行过滤
        
        Student *s1=[[Student alloc] initWithName:@"杨明" andAge:21];
        s1.height=170;
        Student *s2=[[Student alloc]initWithName:@"yangguo" andAge:24];
        s2.height=167;
        Student *s3=[[Student alloc] initWithName:@"yinzhipin" andAge:32];
        s3.height=165;
        Student *s4=[[Student alloc] initWithName:@"yangkang" andAge:22];
        s4.height=178;
        NSArray *arr1=@[s1,s2,s3,s4];
        //关系运算符 <,>,>=,<=,==,!=
        NSPredicate *pre2=[NSPredicate predicateWithFormat:@"age>=22"];
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:pre2]);
        //逻辑运算符 AND OR NOT
        NSPredicate *pre3=[NSPredicate predicateWithFormat:@"age>=22 AND height>175"];
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:pre3]);
        //ALL表示所有
        NSPredicate *pre4=[NSPredicate predicateWithFormat:@"ALL age>=22"];
        if ([pre4 evaluateWithObject:arr1])
        {
            NSLog(@"arr1中的所有年龄都超过21...");
        }
        else
        {
            NSLog(@"不是所有的年龄都大于21");
        }
        //{}里面有的数据才会显示IN   范围：BETWEEN都是可以的！IN精确查找，BETWEEN模糊查找
        NSPredicate *pre5=[NSPredicate predicateWithFormat:@"age BETWEEN{22,40}"];
        NSLog(@":%@,%@",[arr1 filteredArrayUsingPredicate:pre5],[arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"age in {22,24,32}"]]);
        //是否用XXX开头BEGINSWITH
        NSPredicate *pre6=[NSPredicate predicateWithFormat:@"name BEGINSWITH[c] 'yang'"];//默认为d区分大小写;c不区分大小写
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:pre6]);
        //是否以XXX结尾
        NSPredicate *pre7=[NSPredicate predicateWithFormat:@"name ENDSWITH[c] 'g'"];
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:pre7]);
        //是否包含XXX
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name CONTAINS[c] 'i'"]]);
        //LIKE *多个，?一个
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name LIKE[c] '*g??'"]]);
        //格式化：%K给键占位，%@给值占位
        NSString *key=@"age";
        NSPredicate *pre8=[NSPredicate predicateWithFormat:@"%K >= %d",key,22];
        NSLog(@"%@",[arr1 filteredArrayUsingPredicate:pre8]);
        //了解 谓词模板
        NSDictionary *dic1=@{@"height":@165,@"age":@24};
        NSPredicate *pre9=[NSPredicate predicateWithFormat:@"age >=$age AND height>=$height"];
        pre9=[pre9 predicateWithSubstitutionVariables:dic1];
        NSLog(@">>%@",[arr1 filteredArrayUsingPredicate:pre9]);
        
        // 正则表达式
        NSString *regularExpress = @"[A-Za-z0-9%_]+@[A-Za-z]+\\.[a-z0-9]{2,4}";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularExpress];
        if([pred evaluateWithObject:@"535232@qq.com"]==NO)
        {
            NSLog(@"邮箱格式不正确...");
        }
        else
        {
            NSLog(@"邮箱格式正确...");
        }
    }
    return 0;
}
