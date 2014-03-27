//
//  NSFileManager+Slovnik.m
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "NSFileManager+Slovnik.h"

NSString * const kRecentSearchesFileName = @"com.jakubpetrik.slovnik.search.store";

@implementation NSFileManager (Slovnik)

- (NSString *)findOrCreateDirectory:(NSSearchPathDirectory)searchPathDirectory
                           inDomain:(NSSearchPathDomainMask)domainMask
                appendPathComponent:(NSString *)appendComponent
                              error:(NSError *__autoreleasing *)errorOut {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, domainMask, YES);

    if (![paths count]) {

        *errorOut = [[NSError alloc]
                  initWithDomain:NSCocoaErrorDomain
                  code:-911
                  userInfo:@{@"reason": @"No paths for given domain mask."}];
        return nil;
    }

    NSString *resolvedPath = paths[0];

    if (appendComponent) {
        resolvedPath = [resolvedPath stringByAppendingPathComponent:appendComponent];
    }

    NSError *error;

    BOOL success = [self createDirectoryAtPath:resolvedPath
                   withIntermediateDirectories:YES
                                    attributes:nil
                                         error:&error];
    if (!success) {

        if (errorOut) {
            *errorOut = error;
        }
        return nil;
    }

    if (errorOut) {
        *errorOut = nil;
    }

    return resolvedPath;

}

- (NSString *)applicationSupportDirectory {

    NSString *executableName = [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleExecutable"];
    NSError *error = nil;
    NSString *result = [self findOrCreateDirectory:NSApplicationSupportDirectory
                                          inDomain:NSUserDomainMask
                               appendPathComponent:executableName
                                             error:&error];
    if (error) {
        NSLog(@"Unable to find or create application support directory:\n%@", error);
    }

    return result;

}

+ (NSString *)searchStoreFilePath {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [[fileManager applicationSupportDirectory]
            stringByAppendingPathComponent:kRecentSearchesFileName];
}

+ (void)arhiveSearchStore:(NSMutableArray *)store; {

    NSString *path = [self searchStoreFilePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:store toFile:path];
    if (success) {
        NSLog(@"Search store successfully archived to file:\n%@", path);
    } else {
        NSLog(@"Error archiving store to file:\n%@", path);
    }

}

+ (NSMutableArray *)unarchivedSearchStore {

    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self searchStoreFilePath]];
}

@end
