//
//  NSData+Encryption.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/10.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,DataEncryption){
    DataEncryptionMD2,
    DataEncryptionMD4,
    DataEncryptionMD5,
    DataEncryptionSHA1,
    DataEncryptionSHA224,
    DataEncryptionSHA256,
    DataEncryptionSHA384,
    DataEncryptionSHA512,
};

@interface NSData (Encryption)

/*
 *  NSData 加密
 *
 *  @param type 加密类型
 */
- (NSData *) dataEncryptionType:(DataEncryption)type;

@end
