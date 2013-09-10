//
//  MasterTabController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface MasterTabController : UITabBarController {
    Singleton *singleton;
}

@end
