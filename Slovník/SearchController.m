//
//  KeywordController.m
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "SearchController.h"

#define ENTER_KEY_SEL @selector(insertNewline:)

NSString * const SearchControllerEnterPressedNotification = @"SearchControllerEnterPressedNotification";

@implementation SearchController

- (void)awakeFromNib {

    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(userClickedAtSearch:)
     name:RecentSearchesTableEnterKeyPressedNotification object:nil];
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}

- (void)sendEnterKeyPressedNotification {

    [[NSNotificationCenter defaultCenter]
     postNotificationName:SearchControllerEnterPressedNotification
     object:self.searchBar.stringValue];
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector {

    if (commandSelector == ENTER_KEY_SEL) {
        [self sendEnterKeyPressedNotification];
    }
    return NO;
}

- (void)showPopover {

    [self.popover showRelativeToRect:[self.searchBar bounds]
                              ofView:self.searchBar
                       preferredEdge:NSMinYEdge];
}

- (void)hidePopover {
    
    [self.popover close];
}

- (IBAction)newWord:(id)sender {

    [self.searchBar becomeFirstResponder];
}

- (IBAction)toggleRecentWords:(id)sender {

    if (self.popover.isShown) {
        [self hidePopover];
    } else {
        [self showPopover];
    }
}

- (void)userClickedAtSearch:(NSNotification *)note {

    NSString *recentSearch = note.object;
    [self.searchBar setStringValue:recentSearch];
    [self sendEnterKeyPressedNotification];
    [self hidePopover];
}


@end
