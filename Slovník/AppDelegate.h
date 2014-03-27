//
//  AppDelegate.h
//  Slovník
//
//  Created by Jakub Petrík on 4/19/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferencesWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) PreferencesWindowController *preferencesController;
@property (assign) IBOutlet NSWindow *window;
- (IBAction)openPreferences:(id)sender;

@end
