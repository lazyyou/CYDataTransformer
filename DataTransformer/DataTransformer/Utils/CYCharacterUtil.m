//
//  CYCharacterUtil.m
//  DataTransformer
//
//  Created by  阿友哥 on 2018/3/22.
//  Copyright © 2018年  阿友哥. All rights reserved.
//

#import "CYCharacterUtil.h"

@implementation CYCharacterUtil

+ (NSString *)stringToDataString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *description = [data description];
    NSString *dataString = [description stringByReplacingOccurrencesOfString:@" " withString:@""];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    dataString = [dataString stringByReplacingOccurrencesOfString:@">" withString:@""];

    return dataString;
};

+ (NSString *)dataStringToString:(NSString *)dataString {
    ///// 将16进制数据转化成Byte 数组
    NSString *hexString = [dataString stringByReplacingOccurrencesOfString:@" " withString:@""];
    int j=0;
    Byte bytes[1280]; ///3ds key的Byte 数组， 128位
    for(int i=0;i<[hexString length];i++)
    {
        int int_ch; /// 两位16进制数转化后的10进制数
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = (hex_char2-55); //// A 的Ascll - 65
        else
            int_ch2 = (hex_char2-87); //// a 的Ascll - 97
        int_ch = int_ch1+int_ch2;
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        j++;
    }
    
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:hexString.length/2];
    NSString *string = [[NSString alloc] initWithData:newData encoding:NSUTF8StringEncoding];

    return string;
}

@end
