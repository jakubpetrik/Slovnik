//
//  NSFileManager+Slovnik.h
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Slovnik)

- (NSString *)findOrCreateDirectory:(NSSearchPathDirectory)searchPathDirectory
                           inDomain:(NSSearchPathDomainMask)domainMask
                appendPathComponent:(NSString *)appendComponent
                              error:(NSError **)error;

- (NSString *)applicationSupportDirectory;

+ (NSString *)searchStoreFilePath;

+ (void)arhiveSearchStore:(NSMutableArray *)store;
+ (NSMutableArray *)unarchivedSearchStore;

@end
