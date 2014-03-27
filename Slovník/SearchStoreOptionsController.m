//
//  SearchStoreOptionsController.m
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "SearchStoreOptionsController.h"
#import "NSUserDefaults+Slovnik.h"

NSString * const SearchStoreShouldClearNotification = @"SearchStoreShouldClearNotification";
NSString * const SearchStoreShouldApplyNewLimitNotification = @"SearchStoreShouldApplyNewLimitNotification";
NSString * const SearchStoreLimitKey = @"SearchStoreLimit";

@implementation SearchStoreOptionsController

- (void)setDefaultValues {

    NSInteger limit = [NSUserDefaults searchStoreLimit];
    [self updateLabelWithLimit:limit];
    [self.limitSlider setIntegerValue:limit];
}

- (void)awakeFromNib {

    [self setDefaultValues];
}

- (void)updateLabelWithLimit:(NSUInteger)limit {

    [self.limitLabel setStringValue:[NSString stringWithFormat:@"%ld slov", limit]];
}

- (IBAction)clearSearchStore:(id)sender {

    [[NSNotificationCenter defaultCenter]
     postNotificationName:SearchStoreShouldClearNotification
     object:nil];
}

- (IBAction)cancel:(id)sender {

    [self setDefaultValues];
}

- (IBAction)apply:(id)sender {

    NSInteger newLimit = [self.limitSlider integerValue];
    [NSUserDefaults setSearchStoreLimit:newLimit];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:SearchStoreShouldApplyNewLimitNotification
     object:@(newLimit)];
}

- (IBAction)limitChanged:(NSSlider *)sender {
    
    [self updateLabelWithLimit:[sender integerValue]];
}


@end
