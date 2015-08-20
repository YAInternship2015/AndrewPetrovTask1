//
//  NSString+APMusicalInstrumentsManager.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "NSString+APMusicalInstrumentsManager.h"

@implementation NSString (APMusicalInstrumentsManager)

+ (NSString *)documentFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    return paths[0];
}

+ (NSString *)instrumentsPlistPath {
    return [[NSString documentFolderPath] stringByAppendingPathComponent:@"MusicInstruments.plist"];
}

@end
