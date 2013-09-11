//
//  HoleInputController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "HoleInputController.h"
#import "HoleTableController.h"

@implementation HoleInputController


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
    
    self.stat_name_label.text       = self.stat_name;
    self.putt_stepper_label.text    = self.putt_nummber;
    self.fairway_stepper_label.text = self.fairway_number;
    self.penalty_stepper_label.text = self.penalty_number;
    self.green_stepper_label.text   = self.green_number;
    self.stroke_stepper_label.text  = self.stroke_number;
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
 Changes the value of the putt label
 
 @param sender
            The receiver’s sender
 @return
            Changes the putt label
 */
- (IBAction) putt_value_changed:(id)sender {
    self.putt_stepper_label.text = [NSString stringWithFormat:@"%d", (int)self.putt_stepper.value];
}


/**
 Changes the value of the fairway label
 
 @param sender
            The receiver’s sender
 @return
            Changes the fairway label
 */
- (IBAction) fairway_value_changed:(id)sender{
    self.fairway_stepper_label.text = [NSString stringWithFormat:@"%d", (int)self.fairway_stepper.value];
}


/**
 Changes the value of the green label
 
 @param sender
            The receiver’s sender
 @return
            Changes the penalty label
 */
- (IBAction) penalty_value_changed:(id)sender{
    self.penalty_stepper_label.text = [NSString stringWithFormat:@"%d", (int)self.penalty_stepper.value];
}


/**
 Changes the value of the green label
 
 @param sender
            The receiver’s sender
 @return
            Changes the green label
 */
- (IBAction) green_value_changed:(id)sender{
    self.green_stepper_label.text = [NSString stringWithFormat:@"%d", (int)self.green_stepper.value];
}


/**
 Changes the value of the stroke label
 
 @param sender
            The receiver’s sender
 @return
            Changes the stoke label
 */
-  (IBAction) stroke_value_changed:(id)sender{
    self.stroke_stepper_label.text = [NSString stringWithFormat:@"%d", (int)self.stroke_stepper.value];
}


/**
 Sends an alert view when the submit button is clicked
 
 @param sender
            The receiver’s sender
 @return
            An alert view
 */
-  (IBAction) save_button:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"ALERT"
                                message:@"Are you sure you wish to submit?\n All data will be stored/ overwritten."
                               delegate:self
                      cancelButtonTitle:@"Dismiss"
                      otherButtonTitles:@"Submit", nil];
    
    [alert show];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction) cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 Sent to the delegate when the user clicks a button on an alert view
 
 @param alertView
                The alert view containing the button
 @param buttonIndex
                The index of the button that was clicked. The button indices start at 0
 */
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // Dimiss button was pressed
    if (buttonIndex == 0) {
        /* Do nothing */
    }

    // Submit button was pressed
    if (buttonIndex == 1) {
        
        HoleTableController *hole_table = [self.storyboard instantiateViewControllerWithIdentifier:@"hole_table"];
        hole_table.penalties = [self.penalty_stepper_label.text intValue];
        hole_table.greens = [self.green_stepper_label.text intValue];
        
        [self.delegate addItemViewController:self didFinishEnteringScore:[self.stroke_stepper_label.text intValue]];
        [self.delegate addItemViewController:self didFinishEnteringPutts:[self.putt_stepper_label.text intValue]];
        [self.delegate addItemViewController:self didFinishEnteringFairway:[self.fairway_stepper_label.text intValue]];
        [self.delegate addItemViewController:self didFinishEnteringPenalty:[self.penalty_stepper_label.text intValue]];
        [self.delegate addItemViewController:self didFinishEnteringGreen:[self.green_stepper_label.text intValue]];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
