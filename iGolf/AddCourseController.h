//
//  AddCourseController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/17/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface AddCourseController : UIViewController <UITextFieldDelegate>{
    Singleton *singleton;
}

@property (nonatomic, strong) IBOutlet UILabel             *course_name_label;
@property (nonatomic, strong) IBOutlet UILabel             *course_slope_label;
@property (nonatomic, strong) IBOutlet UILabel             *course_rating_label;
@property (nonatomic, retain) IBOutlet UITextField         *course_name_field;
@property (nonatomic, retain) IBOutlet UITextField         *course_slope_field;
@property (nonatomic, retain) IBOutlet UITextField         *course_rating_field;
@property (nonatomic, strong) IBOutlet UIBarButtonItem     *clear_button;
@property (nonatomic, strong) IBOutlet UIBarButtonItem     *save_button;
@property (nonatomic, strong)          NSString            *name;
@property (nonatomic, strong)          NSNumber            *slope;
@property (nonatomic, strong)          NSNumber            *rating;

- (IBAction) save_button:(id)sender;

- (IBAction) cancel_button:(id)sender;

@end
