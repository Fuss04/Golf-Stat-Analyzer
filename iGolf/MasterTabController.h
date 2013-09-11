//
//  MasterTabController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Singleton;

@interface MasterTabController : UITabBarController

@property (nonatomic, strong) Singleton *singleton;

@end
