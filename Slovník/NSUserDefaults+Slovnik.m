//
//  NSUserDefaults+Slovnik.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "NSUserDefaults+Slovnik.h"

NSString * const DefaultsRegisteredKey = @"DefaultsRegistered";

@implementation NSUserDefaults (Slovnik)

+ (void)registerAppDefaults {


    if ([[self standardUserDefaults] boolForKey:DefaultsRegisteredKey] == NO)
    {
        NSLog(@"First time run... setting up user defaults.");
        NSDictionary *appDefaults  = @{DefaultsRegisteredKey : @YES};
        [self setSearchOptionsMask:AllSearchOptions];
        [self setSearchStrategy:SearchStrategyExact];
        [self setSearchStoreLimit:20];
        [[self standardUserDefaults] registerDefaults:appDefaults];
        [[self standardUserDefaults] synchronize];
    }
    [[self standardUserDefaults] setBool:YES forKey:DefaultsRegisteredKey];
}

+ (NSUInteger)searchOptionsMask {

    return [[self standardUserDefaults]
            integerForKey:SearchOptionsMaskKey];
}

+ (void)setSearchOptionsMask:(NSUInteger)optionsMask {

    [[self standardUserDefaults]
     setInteger:optionsMask
     forKey:SearchOptionsMaskKey];
}

+ (NSUInteger)searchStrategy {

    return [[self standardUserDefaults]
            integerForKey:SearchStrategyKey];
}

+ (void)setSearchStrategy:(NSUInteger)searchStrategy {

    [[self standardUserDefaults]
     setInteger:searchStrategy
     forKey:SearchStrategyKey];
}

+ (NSInteger)searchStoreLimit {

    return [[self standardUserDefaults]
            integerForKey:SearchStoreLimitKey];
}

+ (void)setSearchStoreLimit:(NSInteger)limit {

    [[self standardUserDefaults]
     setInteger:limit
     forKey:SearchStoreLimitKey];
}

@end
