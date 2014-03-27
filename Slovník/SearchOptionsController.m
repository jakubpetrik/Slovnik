//
//  SearchOptionsController.m
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "SearchOptionsController.h"
#import "NSUserDefaults+Slovnik.h"

NSUInteger const StrategySelectPopUpTag = 200;
NSString * const SearchOptionsMaskKey = @"SearchOptionsMask";
NSString * const SearchStrategyKey = @"SearchStrategy";

@implementation SearchOptionsController

- (void)awakeFromNib {

    _searchOptionsMask = [NSUserDefaults searchOptionsMask];
    for (int i = SearchOptionKSSJ4; i < SearchOptionMAX; i <<= 1) {
        [self toggleOptionWithMask:i];
    }
    
    [self selectStrategy:[NSUserDefaults searchStrategy]];

}

- (void)selectStrategy:(SearchStrategy)strategy {

    NSPopUpButton *strategyPopUp = [self.containerView viewWithTag:StrategySelectPopUpTag];
    [strategyPopUp selectItemWithTag:strategy];
}

- (void)toggleOptionWithMask:(SearchOptions)mask {

    NSButton *optionButton = [self.containerView viewWithTag:mask];
    if (_searchOptionsMask & mask) {
        optionButton.state = 1;
    } else {
        optionButton.state = 0;
    }

}

- (IBAction)toggleOption:(NSButton *)sender {

    if (sender.state == 0) {
        _searchOptionsMask ^= sender.tag;
    } else {
        _searchOptionsMask |= sender.tag;
    }

    [NSUserDefaults setSearchOptionsMask:_searchOptionsMask];
}

- (IBAction)searchStrategyChanged:(NSPopUpButton *)sender {

    NSMenuItem *selectedStrategy = [sender selectedItem];
    [NSUserDefaults setSearchStrategy:selectedStrategy.tag];
}

@end
