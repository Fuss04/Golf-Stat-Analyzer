//
//  Course.m
//  iGolf
//
//  Created by Jacob Fuss on 4/11/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "Course.h"
#import "Round.h"

@implementation Course


/**
 Construct of a Course object
 
 @param name
            Name of the golf course
 @param slope
            Slope of the golf course (used in handicap and tells how hard a course is)
 @param rating
            Rating of the golf course (used in handicap and tells what a scratch "good" golfer would score)
 @return
            The Course object
 */
- (id) initWith:(NSString *)name difficulty:(NSInteger)slope and:(NSInteger)rating{
    self = [super init];
    
    if (self) {
        self.course_name       = name;
        self.course_rating     = rating;
        self.course_slope      = slope;
        self.rounds_for_course = [[NSMutableArray alloc] init];
        self.scorecard         = [[NSMutableArray alloc] init];
    }
    
    return self;
}


/**
 Defualt constructor for a Course Object
 */
- (id) init{
    self = [super init];
    
    if(self) {
        self.course_name       = nil;
        self.course_rating     = 0;
        self.course_slope      = 0;
        self.rounds_for_course = [[NSMutableArray alloc] init];
        self.scorecard         = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/**
 Adds a new round to the course
 
 @param score
                    Number of strokes for that round
 @param putts
                    Number of putts for that round
 @param fairways
                    Number of fairways hit for that round
 @param penalties
                    Number of penalties for that round
 @param in_regulation
                    Number of greens hit in regulation for that round
 */
- (void)      add:(NSInteger)score
toRoundWithNumber:(NSInteger)putts
      numberOfHit:(NSInteger)fairways
         numberOf:(NSInteger)penalties
andNumberOfGreens:(NSInteger)in_regulation{
    
    // Create new a new round
    Round *new_round = [[Round alloc] initWith:self.course_name
                               numberOfStrokes:score
                                      numberOf:putts
                               withNumberOfHit:fairways
                                  withNumberOf:penalties
                             andNumberOfGreens:in_regulation];
    
    // Adds the new_round to the array of rounds
    [self.rounds_for_course addObject:new_round];
}


/**
 
 
 @param new_round
 */
- (void) addRound:(Round *)new_round{
    [self.rounds_for_course addObject:new_round];
}

@end
