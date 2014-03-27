//
//  SearchOptionsController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchOptionsController : NSObject

- (IBAction)toggleOption:(NSButton *)sender;
- (IBAction)searchStrategyChanged:(NSPopUpButton *)sender;

@property (weak) IBOutlet NSView *containerView;
@property (assign) NSUInteger searchOptionsMask;

@end
