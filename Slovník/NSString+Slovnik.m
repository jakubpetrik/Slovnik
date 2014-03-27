//
//  NSString+Slovnik.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "NSString+Slovnik.h"
#import "NSUserDefaults+Slovnik.h"

@implementation NSString (Slovnik)

- (NSString *)pathByAppendingSearchStrategy {

    SearchStrategy searchStrategy = [NSUserDefaults searchStrategy];
    NSString *strategy;

    switch (searchStrategy) {
        case SearchStrategyExact:
            strategy = @"exact";
            break;
        case SearchStrategyPrefix:
            strategy = @"prefix";
            break;
        case SearchStrategySubString:
            strategy = @"substring";
            break;
        case SearchStrategySuffix:
            strategy = @"suffix";
            break;
    }

    return [NSString stringWithFormat:@"%@&s=%@",self, strategy];
}

- (NSString *)pathByAppendingSearchOptions {

    SearchOptions optionsMask = [NSUserDefaults searchOptionsMask];

    NSString *searchOptions = [self copy];

    if (optionsMask & SearchOptionKSSJ4) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=kssj4"];
    }
    if (optionsMask & SearchOptionPSP) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=psp"];
    }
    if (optionsMask & SearchOptionSCS) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=scs"];
    }
    if (optionsMask & SearchOptionSSS) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=sss"];
    }
    if (optionsMask & SearchOptionSSJ) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=peciar"];
    }
    if (optionsMask & SearchOptionMA) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=ma"];
    }
    if (optionsMask & SearchOptionHSSJV) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=hssjV"];
    }
    if (optionsMask & SearchOptionBER) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=bernolak"];
    }
    if (optionsMask & SearchOptionOBCE) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=obce"];
    }
    if (optionsMask & SearchOptionPRZSK) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=priezviska"];
    }
    if (optionsMask & SearchOptionUN) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=un"];
    }
    if (optionsMask & SearchOptionSO) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=locutio"];
    }
    if (optionsMask & SearchOptionSKCS) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=pskcs"];
    }
    if (optionsMask & SearchOptionSKEN) {
        searchOptions = [searchOptions stringByAppendingString:@"&d=psken"];
    }

    return searchOptions;
}

+ (NSString *)escapedPathForWord:(NSString *)word {

    NSString *path = [NSString stringWithFormat:@"http://slovniky.korpus.sk/?w=%@", word];
    path = [path pathByAppendingSearchStrategy];
    path = [path pathByAppendingSearchOptions];
    return [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)scriptFromFile:(NSString *)file ofType:(NSString *)fileType {

    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:file ofType:fileType];
    NSError *error = nil;
    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error = %@", error);
        return nil;
    }
    return script;
}

@end
