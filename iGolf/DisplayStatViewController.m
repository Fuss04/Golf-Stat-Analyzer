//
//  DisplayStatViewController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "DisplayStatViewController.h"
#import "Singleton.h"
#import "StatisticAnlaysis.h"

@implementation DisplayStatViewController


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
    
    self.stat_title_label.text = self.stat_title;
    self.stat_value_label.text = self.stat_value;
}


/**
 Sent to the view controller when the app receives a memory warning
 */
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
