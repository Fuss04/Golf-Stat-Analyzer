//
//  MasterTabController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "MasterTabController.h"
#import "Singleton.h"
#import "CourseSelectionController.h"
#import "TableOfStats.h"

@implementation MasterTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        CourseSelectionController *courseVC = [[CourseSelectionController alloc] init];
        [courseVC.tabBarItem setImage:[UIImage imageNamed:@"first.png"]];
        [courseVC.tabBarItem setTitle:@"Courses"];
        [courseVC.tabBarItem setTag:0];
        
        TableOfStats *statsTableVC = [[TableOfStats alloc] init];
        [statsTableVC.tabBarItem setImage:[UIImage imageNamed:@"second.png"]];
        [statsTableVC.tabBarItem setTitle:@"Courses"];
        [statsTableVC.tabBarItem setTag:1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.singleton = [Singleton sharedManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
