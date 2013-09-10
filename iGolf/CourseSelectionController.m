//
//  CourseSelectionController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "CourseSelectionController.h"
#import "AddCourseController.h"
#import "HoleTableController.h"

@implementation CourseSelectionController

@synthesize add_course;
@synthesize table_view;
@synthesize data_array;

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
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"ALERT"
                          message:@"Clicking on a Course will start a new round."
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];
 
    singleton = [Singleton sharedManager];
    data_array = [singleton.player_data allKeys];
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
 
 @param animated
 */
- (void) viewWillAppear:(BOOL)animated{
    
    singleton = [Singleton sharedManager];
    data_array = [singleton.player_data allKeys];
    
    [table_view reloadData];
    
    [super viewWillAppear:animated];    
}


/**
 Returns a Boolean value indicating whether the view controller supports the specified orientation
 
 @param interfaceOrientation
                        The orientation of the application’s user interface after the rotation. The possible values are described in UIInterfaceOrientation
 @return
                        YES if the view controller supports the specified orientation or NO if it does not
 */
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}


/**
 Tells the data source to return the number of rows in a given section of a table view. (required)
 
 @param tableView
                The table-view object requesting this information
 @param section
                An index number identifying a section in tableView
 @return
                The number of rows in section
 */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    
    singleton = [Singleton sharedManager];

    return [data_array count];
}


/**
 Asks the data source for a cell to insert in a particular location of the table view. (required)
 
 @param tableView
                A table-view object requesting the cell
 @param indexPath
                An index path locating a row in tableView
 @return
                An object inheriting from UITableViewCell that the table view can use for the specified row. An assertion is raised if you return nil
 */
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CourseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [data_array objectAtIndex:indexPath.row];
    return cell;
}


/**
 
 
 @param sender
 @return
 */
- (IBAction) add_button:(id)sender{
    AddCourseController *add_new_course = [self.storyboard instantiateViewControllerWithIdentifier:@"add_new_course"];
    [self.navigationController pushViewController:add_new_course animated:YES];
}


/**
 Tells the delegate that the specified row is now selected
 
 @param tableView
                A table-view object informing the delegate about the new row selection
 @param indexPath
                An index path locating the new selected row in tableView
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HoleTableController *hole_table = [self.storyboard instantiateViewControllerWithIdentifier:@"hole_table"];
    hole_table.course_name = [data_array objectAtIndex:indexPath.row];
    [self presentViewController:hole_table animated:YES completion:nil];
}

@end
