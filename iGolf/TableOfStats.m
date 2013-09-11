//
//  TableOfStats.m
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "TableOfStats.h"
#import "DisplayStatViewController.h"
#import "StatisticAnlaysis.h"
#import "Singleton.h"

@implementation TableOfStats


/**
 Sets up the data for the view
 */
- (void) setupDataSource{
    
    self.singleton   = [Singleton sharedManager];
    
    [self.stats findLowestRoundToDate:self.singleton.player_data];
    
    int lowest_round      = self.stats.lowest_round;
    int average_round     = [self.stats calcAverageRoundFrom:self.singleton.player_data];
    int average_putts     = [self.stats calcAveragePuttsFrom:self.singleton.player_data];
    int average_fairways  = [self.stats calcAverageFairwaysFrom:self.singleton.player_data];
    int average_penalties = [self.stats calcAveragePenaltiesFrom:self.singleton.player_data];
    int average_greens    = [self.stats calcAverageGreensFrom:self.singleton.player_data];
    int handicap          = [self.stats calcHandicapFrom:self.singleton.player_data];
    
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", lowest_round] forKey:@"Lowest Round"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", average_round] forKey:@"Average Round"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", average_putts] forKey:@"Average Putts"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", average_fairways] forKey:@"Average Fairways"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", average_penalties] forKey:@"Average Penalties"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", average_greens] forKey:@"Average Greens"];
    [self.stat_values setValue:[NSString stringWithFormat:@"%d", handicap] forKey:@"Handicap"];
    
    self.stat_titles = [self.stat_values allKeys];
}


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
    self.stat_values = [[NSMutableDictionary alloc] init];
    self.stats       = [[StatisticAnlaysis alloc] init];
    [self setupDataSource];
    //NSLog(@"viewDidLoad: loading dataSource in tableOfStats");
}


/**
 Sent to the view controller when the app receives a memory warning
 */
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setupDataSource];
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
    return [self.stat_titles count];
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
    static NSString *simpleTableIdentifier = @"StatCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.stat_titles objectAtIndex:indexPath.row];
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
    DisplayStatViewController *display_stat = [self.storyboard instantiateViewControllerWithIdentifier:@"display_stat"];
    display_stat.stat_title = [self.stat_titles objectAtIndex:indexPath.row];
    display_stat.stat_value = [self.stat_values objectForKey:display_stat.stat_title];
    [self.navigationController pushViewController:display_stat animated:YES];
}

@end
