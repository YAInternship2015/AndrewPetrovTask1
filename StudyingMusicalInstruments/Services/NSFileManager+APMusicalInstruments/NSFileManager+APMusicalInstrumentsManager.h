//
//  NSString+APMusicalInstrumentsManager.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (APMusicalInstrumentsManager)

+ (NSString *)documentFolderPath;
+ (NSString *)instrumentsPlistPath;
+ (NSString *)sourceInstrumentsPlistPath;
@end
