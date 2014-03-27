//
//  KeywordController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchController : NSObject <NSTextFieldDelegate, NSPopoverDelegate>

@property (weak) IBOutlet NSTextField *searchBar;
@property (weak) IBOutlet NSPopover *popover;

- (IBAction)newWord:(id)sender;
- (IBAction)toggleRecentWords:(id)sender;
@end
