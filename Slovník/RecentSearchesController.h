//
//  RecentSearchesController.h
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStore.h"

@interface RecentSearchesController : NSObject <NSTableViewDataSource, NSTableViewDelegate> {

    SearchStore *_searchStore;
}

@property (weak) IBOutlet NSTableView *tableView;

@end
