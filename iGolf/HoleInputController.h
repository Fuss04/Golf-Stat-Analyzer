//
//  HoleInputController.h
//  iGolf
//
//  Created by Jacob Fuss on 4/16/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HoleInputController;

@protocol HoleInputControllerDelegate <NSObject>

- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringScore:(NSInteger)item;

- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringPutts:(NSInteger)item;

- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringFairway:(NSInteger)item;

- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringPenalty:(NSInteger)item;

- (void)addItemViewController:(HoleInputController *)controller didFinishEnteringGreen:(NSInteger)item;

@end

@interface HoleInputController : UIViewController

@property (nonatomic, retain)          NSString         *stat_name;
@property (nonatomic, retain) IBOutlet UILabel          *stat_name_label;
@property (nonatomic, strong) IBOutlet UILabel          *putt_stepper_label;
@property (nonatomic, strong) IBOutlet UILabel          *fairway_stepper_label;
@property (nonatomic, strong) IBOutlet UILabel          *penalty_stepper_label;
@property (nonatomic, strong) IBOutlet UILabel          *green_stepper_label;
@property (nonatomic, strong) IBOutlet UILabel          *stroke_stepper_label;
@property (nonatomic, strong) IBOutlet UIStepper        *putt_stepper;
@property (nonatomic, strong) IBOutlet UIStepper        *fairway_stepper;
@property (nonatomic, strong) IBOutlet UIStepper        *penalty_stepper;
@property (nonatomic, strong) IBOutlet UIStepper        *green_stepper;
@property (nonatomic, strong) IBOutlet UIStepper        *stroke_stepper;
@property (nonatomic, strong) IBOutlet UIBarButtonItem  *save_button;
@property (nonatomic, strong) IBOutlet UIBarButtonItem  *cancel_button;
@property (nonatomic, retain)          NSString         *putt_nummber;
@property (nonatomic, retain)          NSString         *stroke_number;
@property (nonatomic, retain)          NSString         *penalty_number;
@property (nonatomic, retain)          NSString         *fairway_number;
@property (nonatomic, retain)          NSString         *green_number;

@property (nonatomic, weak) id <HoleInputControllerDelegate> delegate;

- (IBAction) putt_value_changed:(id)sender;

- (IBAction) fairway_value_changed:(id)sender;

- (IBAction) penalty_value_changed:(id)sender;

- (IBAction) green_value_changed:(id)sender;

- (IBAction) stroke_value_changed:(id)sender;

- (IBAction) save_button:(id)sender;

- (IBAction) cancel:(id)sender;

@end
