//
//  PreferencesWindowController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SearchOptionsController;

@interface PreferencesWindowController : NSWindowController
@property (strong) IBOutlet SearchOptionsController *searchOptionsController;
@end
