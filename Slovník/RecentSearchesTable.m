//
//  RecentSearchesTable.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "RecentSearchesTable.h"

#define KEY_CODE_ENTER 36

NSString * const RecentSearchesTableEnterKeyPressedNotification = @"RecentSearchesTableEnterKeyPressedNotification";

@implementation RecentSearchesTable

- (void)keyDown:(NSEvent *)theEvent {

    if (theEvent.keyCode == KEY_CODE_ENTER) {

        NSInteger selectedRow = [_selectedRows firstIndex];
        NSString *rowValue = [self.dataSource tableView:self objectValueForTableColumn:nil row:selectedRow];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:RecentSearchesTableEnterKeyPressedNotification
         object:rowValue];
        return;

    }
    [super keyDown:theEvent];

}

@end
