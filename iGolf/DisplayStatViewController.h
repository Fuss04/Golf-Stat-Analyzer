//
//  DisplayStatViewController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
#import "StatisticAnlaysis.h"

@interface DisplayStatViewController : UIViewController{
    Singleton         *singleton;
    StatisticAnlaysis *stats;
    
             NSString *stat_title;
             NSString *stat_value;
    IBOutlet UILabel  *stat_title_label;
    IBOutlet UILabel  *stat_value_label;
}

@property (nonatomic, retain)          Singleton         *singleton;
@property (nonatomic, retain)          StatisticAnlaysis *stats;

@property (nonatomic, retain)          NSString *stat_title;
@property (nonatomic, retain)          NSString *stat_value;
@property (nonatomic, retain) IBOutlet UILabel  *stat_title_label;
@property (nonatomic, retain) IBOutlet UILabel  *stat_value_label;

@end
