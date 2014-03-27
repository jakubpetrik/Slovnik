//
//  SearchStore.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "SearchStore.h"
#import "NSFileManager+Slovnik.h"
#import "NSUserDefaults+Slovnik.h"

@implementation SearchStore

+ (id)store {

    return [[self alloc] init];
}

- (id)init {

    if (self = [super init]) {
        _limit = [NSUserDefaults searchStoreLimit];
        _privateStore = (NSMutableArray *)[NSFileManager unarchivedSearchStore];
        if (!_privateStore) {
            _privateStore = [NSMutableArray arrayWithCapacity:_limit];
        }
        [[NSNotificationCenter defaultCenter]
         addObserver:self selector:@selector(save)
         name:NSApplicationWillTerminateNotification object:nil];

    }
    return self;
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}

- (void)save {

    [NSFileManager arhiveSearchStore:_privateStore];
}

- (void)clear {

    [_privateStore removeAllObjects];
    
}

- (void)setLimit:(NSUInteger)limit {

    _limit = limit;
    [self truncateTail];
}

- (void)truncateTail {

    while ([_privateStore count] > self.limit) {
        [_privateStore removeLastObject];
    }
}


- (void)pushObject:(id)object {

    NSUInteger indexOfObject = [_privateStore indexOfObject:object];
    
    if (indexOfObject == NSNotFound) {
        [_privateStore insertObject:object atIndex:0];
        [self truncateTail];
    } else {
        [_privateStore removeObjectAtIndex:indexOfObject];
        [_privateStore insertObject:object atIndex:0];
    }
    
}

- (id)pop {

    id lastObject = [_privateStore lastObject];
    [_privateStore removeLastObject];
    return lastObject;
}

- (id)objectAtIndexedSubscript:(NSUInteger)subscript {

    return _privateStore[subscript];
}

- (NSUInteger)count {

    return [_privateStore count];
}


@end
