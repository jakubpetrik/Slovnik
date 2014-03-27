//
//  NSString+Slovnik.h
//  Slovník
//
//  Created by Jakub Petrík on 4/20/13.
//  Copyright (c) 2013 Jakub Petrík. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Slovnik)
+ (NSString *)escapedPathForWord:(NSString *)word;
+ (NSString *)scriptFromFile:(NSString *)file ofType:(NSString *)fileType;
@end
