//
//  BrowserController.m
//  Slovník
//
//  Created by Jakub Petrík on 4/19/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "BrowserController.h"
#import "NSString+Slovnik.h"

@implementation BrowserController

- (void)toggleSpinnerOn:(BOOL)on {

    if (on) {
        [self.spinner startAnimation:self];
    } else {
        [self.spinner stopAnimation:self];
    }
}

- (void)awakeFromNib {

    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(enterKeyPressed:)
     name:SearchControllerEnterPressedNotification object:nil];

    [self.spinner setBezeled:YES];
    
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}

#pragma mark - SearchControllerDelegate

- (void)enterKeyPressed:(NSNotification *)note {

    NSString *searchWord = note.object;
    [self.webView setMainFrameURL:[NSString escapedPathForWord:searchWord]];
}

#pragma mark - WebFrameLoadDelegate

- (void)webView:(WebView *)webView didClearWindowObject:(WebScriptObject *)windowObject forFrame:(WebFrame *)frame {

    [windowObject evaluateWebScript:[NSString scriptFromFile:@"script" ofType:@"js"]];
    
}

#pragma mark - WebResourceLoadDelegate

- (NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *)dataSource {

    [self toggleSpinnerOn:YES];
    return request;
}

- (void)webView:(WebView *)sender resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource {

    [self toggleSpinnerOn:NO];
}

- (void)webView:(WebView *)sender resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource {

    [self toggleSpinnerOn:NO];
}

@end
