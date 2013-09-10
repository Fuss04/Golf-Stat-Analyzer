//
//  TableOfStats.h
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatisticAnlaysis.h"
#import "Singleton.h"

@interface TableOfStats : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}

@property (nonatomic, retain) Singleton           *singleton;
@property (nonatomic, retain) StatisticAnlaysis   *stats;
@property (nonatomic, retain) NSMutableDictionary *stat_values;
@property (nonatomic, retain) NSArray             *stat_titles;

- (void) setupDataSource;

@end
