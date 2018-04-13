//
//  NSData+Encryption.m
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/10.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSData+Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Encryption)

- (NSData *) dataEncryptionType:(DataEncryption)type{
    switch (type) {
        case DataEncryptionMD2:
        {
            unsigned char hash[CC_MD2_DIGEST_LENGTH];
            (void) CC_MD2( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_MD2_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionMD4:
        {
            unsigned char hash[CC_MD4_DIGEST_LENGTH];
            (void) CC_MD4( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_MD4_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionMD5:
        {
            unsigned char hash[CC_MD5_DIGEST_LENGTH];
            (void) CC_MD5( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_MD5_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionSHA1:
        {
            unsigned char hash[CC_SHA1_DIGEST_LENGTH];
            (void) CC_SHA1( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_SHA1_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionSHA224:
        {
            unsigned char hash[CC_SHA224_DIGEST_LENGTH];
            (void) CC_SHA224( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_SHA224_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionSHA256:
        {
            unsigned char hash[CC_SHA256_DIGEST_LENGTH];
            (void) CC_SHA256( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_SHA256_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionSHA384:
        {
            unsigned char hash[CC_SHA384_DIGEST_LENGTH];
            (void) CC_SHA384( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_SHA384_DIGEST_LENGTH] );
        }
            break;
        case DataEncryptionSHA512:
        {
            unsigned char hash[CC_SHA512_DIGEST_LENGTH];
            (void) CC_SHA512( [self bytes], (CC_LONG)[self length], hash );
            return ( [NSData dataWithBytes: hash length: CC_SHA512_DIGEST_LENGTH] );
        }
            break;
        default:
        {
            return nil;
        }
            break;
    }
    
    return nil;
    
}

@end
