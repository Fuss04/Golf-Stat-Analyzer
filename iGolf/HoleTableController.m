//
//  HoleTableController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "HoleTableController.h"
#import "HoleInputController.h"
#import "Course.h"

@interface HoleTableController ()

@end

@implementation HoleTableController

@synthesize hole_stat;
@synthesize num_hole;
@synthesize cancel_button;
@synthesize score;
@synthesize penalties;
@synthesize putts;
@synthesize greens;
@synthesize fairways;
@synthesize course_name;


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
 Sets up the data for the view
 */
- (void) setupDataSources{
    hole_stat = [[NSMutableDictionary alloc] init];
    NSMutableArray *temp_hole_array = [[NSMutableArray alloc] init];
    
    for (int hole_num = 0; hole_num < 18; hole_num++) {
        NSString *hole = [NSString stringWithFormat:@"Hole %d", hole_num + 1];
        [hole_stat setValue:@"hole" forKey:hole];
        [temp_hole_array addObject:hole];
    }
    
    num_hole = [NSArray arrayWithArray:temp_hole_array];
    
    singleton = [Singleton sharedManager];
}


/**
 
 */
- (void)setRoundVariables
{
    self.score     = 0;
    self.putts     = 0;
    self.penalties = 0;
    self.fairways  = 0;
    self.greens    = 0;
}

/**
 Creates the view that the controller manages
 */
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    new_round = [[Round alloc] init];
    new_hole = [[Hole alloc] init];
    [self setRoundVariables];
    [self setupDataSources];
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
    [super viewWillAppear:animated];
    
    if(new_hole.score != 0){
        printf("%d", hole_number);
        new_hole.hole_number = hole_number;
        [new_round removeHoleNumber:hole_number];
        [new_round.holes_for_round addObject:new_hole];
        new_hole = nil;
    }
    
    if (new_hole == nil)
        new_hole = [[Hole alloc] init];
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
    return [num_hole count];
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
    static NSString *simpleTableIdentifier = @"HoleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [num_hole objectAtIndex:indexPath.row];
    return cell;
}


/**
 Tells the delegate that the specified row is now selected
 
 @param tableView
                A table-view object informing the delegate about the new row selection
 @param indexPath
                An index path locating the new selected row in tableView
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HoleInputController *hole_input = [self.storyboard instantiateViewControllerWithIdentifier:@"hole_input"];
    hole_number = indexPath.row + 1;
    
    Hole *current_hole = [new_round findHoleNumber:(NSInteger)hole_number];
    
    hole_input.putt_nummber   = [NSString stringWithFormat:@"%d", current_hole.putts];
    hole_input.penalty_number = [NSString stringWithFormat:@"%d", current_hole.penalties];
    hole_input.fairway_number = [NSString stringWithFormat:@"%d", current_hole.fairway];
    hole_input.stroke_number  = [NSString stringWithFormat:@"%d", current_hole.score];
    hole_input.green_number   = [NSString stringWithFormat:@"%d", current_hole.green_in_regulation];
    
    hole_input.delegate = self;
    
    [self presentViewController:hole_input animated:YES completion:nil];
}


/**
 
 
 @param sender
 @return
 */
- (IBAction) cancel_button:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 

 @param sender
 @return
 */
- (IBAction) save_button:(id)sender{
    Course *course = [singleton.player_data objectForKey:course_name];
    
    [course.rounds_for_course addObject:new_round];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 
 
 @param controller
 @param item
 */
- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringScore:(NSInteger)item
{
    new_hole.score += item;
}


/**
 
 
 @param controller
 @param item
 */
- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringPutts:(NSInteger)item
{
    new_hole.putts += item;
}


/**
 
 
 @param controller
 @param item
 */
- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringFairway:(NSInteger)item
{
    new_hole.fairway += item;
}


/**
 
 
 @param controller
 @param item
 */
- (void) addItemViewController:(HoleInputController *)controller didFinishEnteringPenalty:(NSInteger)item
{
    new_hole.penalties += item;
}


/**
 
 
 @param controller
 @param item
 */
- (void) addItemViewController:(HoleInputController *)controller didFinishEnteringGreen:(NSInteger)item
{
    new_hole.green_in_regulation += item;
}

@end
