//
//  SearchStoreOptionsController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/21/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchStoreOptionsController : NSObject

@property (weak) IBOutlet NSSlider *limitSlider;
@property (weak) IBOutlet NSTextField *limitLabel;

- (IBAction)clearSearchStore:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)apply:(id)sender;
- (IBAction)limitChanged:(NSSlider *)sender;

@end
