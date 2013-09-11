//
//  HoleTableController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hole;
@class Singleton;
@class Round;
@class HoleInputController;

@interface HoleTableController : UIViewController <UITableViewDelegate, UITableViewDataSource, HoleInputControllerDelegate>

@property (nonatomic, retain)          NSMutableDictionary *hole_stat;
@property (nonatomic, retain)          NSArray             *num_hole;
@property (nonatomic, strong) IBOutlet UIBarButtonItem     *cancel_button;
@property (nonatomic, assign)          NSInteger           score;
@property (nonatomic, assign)          NSInteger           putts;
@property (nonatomic, assign)          NSInteger           fairways;
@property (nonatomic, assign)          NSInteger           penalties;
@property (nonatomic, assign)          NSInteger           greens;
@property (nonatomic, assign)          NSString            *course_name;
@property (nonatomic, strong) IBOutlet UIBarButtonItem     *save_button;
@property (nonatomic, assign)          NSInteger           hole_number;
@property (nonatomic, strong)          Round               *new_round;
@property (nonatomic, strong)          Hole                *new_hole;
@property (nonatomic, strong)          Singleton           *singleton;


- (void) setupDataSources;

- (IBAction) cancel_button:(id)sender;

- (IBAction) save_button:(id)sender;

@end
