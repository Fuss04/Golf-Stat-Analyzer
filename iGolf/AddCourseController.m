//
//  AddCourseController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/17/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "AddCourseController.h"
#import "Course.h"

@interface AddCourseController ()

@end

@implementation AddCourseController

@synthesize course_name_label;
@synthesize course_rating_label;
@synthesize course_slope_label;
@synthesize course_name_field;
@synthesize course_rating_field;
@synthesize course_slope_field;
@synthesize save_button;
@synthesize clear_button;
@synthesize name;
@synthesize slope;
@synthesize rating;


/**
 Returns an NSViewController object initialized to the nib file in the specified bundle
 
 @param nibNameOfNil
                The name of the nib file, without any leading path information
 @param nibBundleOrNil
                The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle
 @return
                The initialized NSViewController object or nil if there were errors during initialization or the nib file could not be located
 */
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/**
 Creates the view that the controller manages
 */
- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    course_name_label.text = @"Course Name";
    course_rating_label.text = @"Course Rating";
    course_slope_label.text = @"Course Slope";
    
    course_name_field.delegate = self;
    course_rating_field.delegate = self;
    course_slope_field.delegate = self;
    
    singleton = [Singleton sharedManager];
}


/**
 Sent to the view controller when the app receives a memory warning
 */
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 Asks the delegate if the text field should process the pressing of the return button
 
 @param textField
            The text field whose return button was pressed
 @return
            YES if the text field should implement its default behavior for the return button; otherwise, NO
 */
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


/**
 Tells the receiver when one or more fingers touch down in a view or window
 
 @param touches
            A set of UITouch instances that represent the touches for the starting phase of the event represented by event
 @param event
            An object representing the event to which the touches belong
 */
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [course_slope_field resignFirstResponder];
    [course_rating_field resignFirstResponder];
    [course_name_field resignFirstResponder];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction) save_button:(id)sender{
    name   = [course_name_field text];
    slope  = [NSNumber numberWithInteger:[course_slope_field.text integerValue]];
    rating = [NSNumber numberWithInteger:[course_rating_field.text integerValue]];
    
    // Create and add course to singleton
    name = course_name_field.text;
    slope = [NSNumber numberWithInteger:[course_slope_field.text integerValue]];
    rating = [NSNumber numberWithInteger:[course_rating_field.text integerValue]];
    Course *new_course = [[Course alloc] initWith:name difficulty:(int)slope and:(int)rating];
    [singleton.player_data setObject:new_course forKey:name];
    
    // Clear the text fields
    course_name_field.text   = @"";
    course_slope_field.text  = @"";
    course_rating_field.text = @"";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction)cancel_button:(id)sender{
    course_name_field.text   = @"";
    course_slope_field.text  = @"";
    course_rating_field.text = @"";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
