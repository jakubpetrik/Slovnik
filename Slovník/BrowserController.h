//
//  BrowserController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/19/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WebView;

@interface BrowserController : NSObject
@property (weak) IBOutlet WebView *webView;
@property (weak) IBOutlet NSProgressIndicator *spinner;
@end
