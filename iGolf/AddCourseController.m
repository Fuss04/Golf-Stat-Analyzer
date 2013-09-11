//
//  AddCourseController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/17/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "AddCourseController.h"
#import "Course.h"
#import "Singleton.h"

@implementation AddCourseController


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
    
    self.course_name_label.text = @"Course Name";
    self.course_rating_label.text = @"Course Rating";
    self.course_slope_label.text = @"Course Slope";
    
    self.course_name_field.delegate = self;
    self.course_rating_field.delegate = self;
    self.course_slope_field.delegate = self;
    
    self.singleton = [Singleton sharedManager];
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
    [self.course_slope_field resignFirstResponder];
    [self.course_rating_field resignFirstResponder];
    [self.course_name_field resignFirstResponder];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction) save_button:(id)sender{
    self.name   = [self.course_name_field text];
    self.slope  = [NSNumber numberWithInteger:[self.course_slope_field.text integerValue]];
    self.rating = [NSNumber numberWithInteger:[self.course_rating_field.text integerValue]];
    
    // Create and add course to singleton
    self.name = self.course_name_field.text;
    self.slope = [NSNumber numberWithInteger:[self.course_slope_field.text integerValue]];
    self.rating = [NSNumber numberWithInteger:[self.course_rating_field.text integerValue]];
    Course *new_course = [[Course alloc] initWith:self.name difficulty:(int)self.slope and:(int)self.rating];
    [self.singleton.player_data setObject:new_course forKey:self.name];
    
    // Clear the text fields
    self.course_name_field.text   = @"";
    self.course_slope_field.text  = @"";
    self.course_rating_field.text = @"";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction)cancel_button:(id)sender{
    self.course_name_field.text   = @"";
    self.course_slope_field.text  = @"";
    self.course_rating_field.text = @"";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
