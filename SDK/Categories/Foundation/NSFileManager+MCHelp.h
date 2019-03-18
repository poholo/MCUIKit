//
// Created by 赵江明 on 15/11/11.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MCHelp)

- (NSString *)documentDirectoryPath;

- (NSString *)libraryDirectoryPath;

- (NSString *)applicationSupportDirectory;

- (NSString *)cacheDirectoryPath;

- (NSString *)temporaryDirectoryPath;

- (NSString *)resourcePath;

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file;

- (NSString *)pathForLibraryDirectoryFile:(NSString *)file;

- (NSString *)pathForapplicationSupportFile:(NSString *)file;

- (NSString *)pathForTemporaryFile:(NSString *)file;

- (NSString *)pathForResource:(NSString *)file;

- (NSString *)pathForCacheFile:(NSString *)file;


- (NSString *)pathForDocumentDirectoryFile:(NSString *)file ofType:(NSString *)fileType;

- (NSString *)pathForapplicationSupportFile:(NSString *)file ofType:(NSString *)fileType;

- (NSString *)pathForTemporaryFile:(NSString *)file ofType:(NSString *)fileType;

- (NSString *)pathForResource:(NSString *)file ofType:(NSString *)fileType;

- (NSString *)pathForCacheFile:(NSString *)file ofType:(NSString *)fileType;

- (BOOL)pathForCreateDirectory:(NSString *)directoryPath;

- (NSString *)pathForDocmentDirectory:(NSString *)directory;

- (NSString *)pathForCacheDirectory:(NSString *)directory;

@end
