//
//  LDSBundle.m
//  LuaDynamic
//
//  Created by LastDays on 16/6/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "LDSBundle.h"

@interface LDSBundle () {
    NSMutableArray *_scriptPaths, *_resourcePaths;
    NSFileManager *_fileManager;
    NSString *_currentPath;
}

@end


@implementation LDSBundle


- (id)init {
    self = [super init];
    if(self) {
        _fileManager = [NSFileManager defaultManager];
        _currentPath = [[NSBundle mainBundle] resourcePath];
        
        _resourcePaths = [NSMutableArray arrayWithObjects:[self PathForCachesResource:nil], @".", nil];
        _scriptPaths = [NSMutableArray arrayWithObject:@"."];
    }
    return self;
}


- (NSString *)absolutePath:(NSString *)path {
    if (path == nil) {
        return nil;
    } else if ([path hasPrefix:@"/"]) {
        return path;
    } else {
        return [_currentPath stringByAppendingPathComponent:path];
    }
}

- (NSString *)scriptPathWithName:(NSString *)name {
    if (name == nil) {
        return nil;
    }
    
    NSString *fullPath = nil;
    for (NSString *dir in _scriptPaths) {
        fullPath = [self absolutePath:[dir stringByAppendingPathComponent:name]];
        if ([_fileManager fileExistsAtPath:fullPath]) {
            return fullPath;
        }
    }
    
    return nil;
}

- (NSData *)scriptWithName:(NSString *)name {
    if (name == nil) {
        return nil;
    }
    
    NSString *fullPath = [self scriptPathWithName:name];
    if (fullPath == nil) {
        return nil;
    }
    
    return [self dataReadFromFile:fullPath];
}

- (NSData*) dataReadFromFile:(NSString*)path {
    if( path ){
        NSFileManager* fm = [NSFileManager defaultManager];
        NSData* data = [fm contentsAtPath:path];
        return data;
    }
    return nil;
}


- (NSString*) PathForCachesResource:(NSString* )relativePath {
    static NSString* cachesPath = nil;
    if (nil == cachesPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        cachesPath = [dirs objectAtIndex:0];
    }
    return [cachesPath stringByAppendingPathComponent:relativePath];
}

@end
