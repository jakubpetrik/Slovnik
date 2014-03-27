//
//  AppDelegate.m
//  Slovník
//
//  Created by Jakub Petrík on 4/19/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import "AppDelegate.h"
#import "NSUserDefaults+Slovnik.h"
#import "PreferencesWindowController.h"

NSString * const kPreferencesNib = @"PreferencesWindowController";

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.window.backgroundColor = [NSColor whiteColor];
    [NSUserDefaults registerAppDefaults];
}

- (IBAction)openPreferences:(id)sender {

    if (!_preferencesController) {
        _preferencesController = [[PreferencesWindowController alloc]
                                  initWithWindowNibName:kPreferencesNib];
    }
    [self.preferencesController showWindow:self];
}

@end
