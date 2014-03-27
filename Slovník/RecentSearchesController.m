//
//  RecentSearchesController.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "RecentSearchesController.h"

@implementation RecentSearchesController

- (void)awakeFromNib {

    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(enterKeyPressed:)
     name:SearchControllerEnterPressedNotification object:nil];

    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(clearSearchStore)
     name:SearchStoreShouldClearNotification object:nil];

    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(setNewLimitForSearchStore:)
     name:SearchStoreShouldApplyNewLimitNotification object:nil];

    _searchStore = [SearchStore store];
    [self.tableView setDoubleAction:@selector(userClickedRow:)];
    [self.tableView setTarget:self];
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}

- (void)enterKeyPressed:(NSNotification *)note {

    [_searchStore pushObject:note.object];
    [self.tableView reloadData];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {

    return [_searchStore count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {

    return _searchStore[row];
}

- (void)userClickedRow:(id)sender {

    NSString *rowValue = _searchStore[[self.tableView clickedRow]];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:RecentSearchesTableEnterKeyPressedNotification
     object:rowValue];

}

- (void)clearSearchStore {

    [_searchStore clear];
    [self.tableView reloadData];
}

- (void)setNewLimitForSearchStore:(NSNotification *)note {

    NSUInteger newLimit = [note.object integerValue];
    _searchStore.limit = newLimit;
    [self.tableView reloadData];
}

@end
