//
// Created by 赵江明 on 15/11/11.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import "NSFileManager+MCHelp.h"

@implementation NSFileManager (MCHelp)

- (NSString *)documentDirectoryPath {
    @synchronized ([NSFileManager class]) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        [path copy];
        return path;
    }
}

- (NSString *)libraryDirectoryPath {
    @synchronized ([NSFileManager class]) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
        [path copy];
        return path;
    }
}

- (NSString *)applicationSupportDirectory {
    @synchronized ([NSFileManager class]) {
        static NSString *path = nil;
        //application support folder
        if (!path) {

            path = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];

            //create the folder if it doesn't exist
            if (![self fileExistsAtPath:path isDirectory:NULL]) {
                BOOL created = [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
                if (!created) {
                    path = nil;
                    return path;
                }
            }
            [path copy];
        }
        return path;
    }
}

- (NSString *)cacheDirectoryPath {
    @synchronized ([NSFileManager class]) {
        static NSString *path = nil;
        if (!path) {
            //cache folder
            path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];

            //create the folder if it doesn't exist
            if (![self fileExistsAtPath:path isDirectory:NULL]) {
                [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
            }

            //copy path
            [path copy];
        }
        return path;
    }
}

- (NSString *)temporaryDirectoryPath {
    static NSString *path = nil;
    if (!path) {
        path = NSTemporaryDirectory();
        //copy path
        [path copy];
    }
    return path;
}

- (NSString *)resourcePath {
    static NSString *path = nil;
    if (!path) {
        //bundle path
        path = [[[NSBundle mainBundle] resourcePath] copy];
    }
    return path;
}

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file {
    return [[self documentDirectoryPath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForLibraryDirectoryFile:(NSString *)file {
    return [[self libraryDirectoryPath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForapplicationSupportFile:(NSString *)file {
    return [[self applicationSupportDirectory] stringByAppendingPathComponent:file];
}

- (NSString *)pathForTemporaryFile:(NSString *)file {
    return [[self temporaryDirectoryPath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForResource:(NSString *)file {
    return [[self resourcePath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForCacheFile:(NSString *)file {
    return [[self cacheDirectoryPath] stringByAppendingPathComponent:file];
}

#pragma mark -
#pragma mark file type Methods -

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file ofType:(NSString *)fileType {
    return [[[self documentDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForapplicationSupportFile:(NSString *)file ofType:(NSString *)fileType {
    return [[[self applicationSupportDirectory] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForTemporaryFile:(NSString *)file ofType:(NSString *)fileType {
    return [[[self temporaryDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForResource:(NSString *)file ofType:(NSString *)fileType {
    return [[[self resourcePath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForCacheFile:(NSString *)file ofType:(NSString *)fileType {
    return [[[self cacheDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (BOOL)pathForCreateDirectory:(NSString *)directoryPath {
    if (![self fileExistsAtPath:directoryPath isDirectory:NULL]) {
        [self createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }

    return YES;
}

- (NSString *)pathForDocmentDirectory:(NSString *)directory {
    NSString *directoryPath = [[self documentDirectoryPath] stringByAppendingPathComponent:directory];
    if (![self fileExistsAtPath:directoryPath isDirectory:NULL]) {
        [self createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return directoryPath;
}

- (NSString *)pathForCacheDirectory:(NSString *)directory {
    NSString *directoryPath = [[self documentDirectoryPath] stringByAppendingPathComponent:directory];
    if (![self fileExistsAtPath:directoryPath isDirectory:NULL]) {
        [self createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return directoryPath;
}

@end
