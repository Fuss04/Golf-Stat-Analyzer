//
//  CourseSelectionController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface CourseSelectionController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    Singleton *singleton;
}

@property (nonatomic, strong) IBOutlet UIBarButtonItem *add_course;
@property (nonatomic, strong) IBOutlet UITableView     *table_view;
@property (nonatomic, retain)          NSArray         *data_array;

- (IBAction) add_button:(id)sender;

@end
