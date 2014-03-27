//
//  NSUserDefaults+Slovnik.h
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Slovnik)

+ (void)registerAppDefaults;

+ (NSUInteger)searchOptionsMask;
+ (void)setSearchOptionsMask:(NSUInteger)optionsMask;

+ (NSUInteger)searchStrategy;
+ (void)setSearchStrategy:(NSUInteger)searchStrategy;

+ (NSInteger)searchStoreLimit;
+ (void)setSearchStoreLimit:(NSInteger)limit;

@end
