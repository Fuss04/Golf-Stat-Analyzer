//
//  Singleton.m
//  iGolf
//
//  Created by Jacob Fuss on 4/19/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "Singleton.h"
#import "Course.h"

@implementation Singleton

+ (id) sharedManager {
    static Singleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id) init {
    if (self = [super init]) {
        self.player_data = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

@end
