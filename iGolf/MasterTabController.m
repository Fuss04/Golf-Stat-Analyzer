//
//  MasterTabController.m
//  iGolf
//
//  Created by Jacob Fuss on 4/21/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "MasterTabController.h"
#import "Singleton.h"

@implementation MasterTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
