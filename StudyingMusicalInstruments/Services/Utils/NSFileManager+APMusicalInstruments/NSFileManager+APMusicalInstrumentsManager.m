//
//  NSString+APMusicalInstrumentsManager.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "NSFileManager+APMusicalInstrumentsManager.h"

@implementation NSFileManager (APMusicalInstrumentsManager)

+ (NSString *)documentFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    return paths[0];
}

+ (NSString *)instrumentsPlistPath {
    return [[NSFileManager documentFolderPath] stringByAppendingPathComponent:@"MusicInstruments.plist"];
}

+ (NSString *)sourceInstrumentsPlistPath {
    return [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
}

+ (BOOL)isInstrumentsPlistExist {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSFileManager instrumentsPlistPath];
    return [fileManager fileExistsAtPath: docPath];
}

@end
