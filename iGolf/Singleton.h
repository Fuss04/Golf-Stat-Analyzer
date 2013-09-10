//
//  Singleton.h
//  iGolf
//
//  Created by Jacob Fuss on 4/19/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject{
    
}

@property (nonatomic, retain) NSMutableDictionary *player_data;

+ (id) sharedManager;

@end
