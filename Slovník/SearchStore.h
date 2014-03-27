//
//  SearchStore.h
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchStore : NSObject {

    NSMutableArray *_privateStore;
}
@property (nonatomic, assign) NSUInteger limit;

+ (id)store;

- (void)pushObject:(id)object;
- (id)pop;

- (id)objectAtIndexedSubscript:(NSUInteger)subscript;
- (NSUInteger)count;

- (void)clear;

@end
