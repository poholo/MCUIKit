//
// Created by majiancheng on 2018/7/18.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "NSURL+MCParse.h"
#import "NSString+MCURLEncoded.h"


@implementation NSURL (MCParse)


- (NSDictionary *)params {
    NSString *query = [self query];
    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];
    if (query) {
        NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner *scanner = [[NSScanner alloc] initWithString:query];
        while (![scanner isAtEnd]) {
            NSString *pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString *key = [kvPair[0] urlDecode];
                NSString *value = [kvPair[1] urlDecode];
                pairs[key] = value;
            }
        }
    }

    return pairs;
}


@end