//
//  Round.m
//  iGolf
//
//  Created by Jacob Fuss on 4/11/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "Round.h"
#import "Hole.h"

@interface Round()
    
- (void) calcTotalScore;
    
- (void) calcTotalPutts;
    
- (void) calcTotalFairway;
    
- (void) calcTotalPenalties;
    
- (void) calcTotalGreens;

@end

@implementation Round

// Getter and Setter methods
// @note The methods are created by the complier
@synthesize holes_for_round;
@synthesize course_name;
@synthesize score;
@synthesize putts;
@synthesize fairways;
@synthesize penalties;
@synthesize greens_in_regulation;


/**
 Constructor for a Round
 
 @param name
                    Name of the golf course
 @param score_in_round
                    Number of stroke in the round
 @param putts_in_round
                    Number of putts in the round
 @param fairways_in_round
                    Number of fairways hit in the round
 @param penalties_in_round
                    Number of penalties in the round
 @param in_regulation
                    Number of greens in regulation in the round
 @return
                    The Round object
 */
- (id)   initWith:(NSString *)name
  numberOfStrokes:(NSInteger)score_in_round
         numberOf:(NSInteger)putts_in_round
  withNumberOfHit:(NSInteger)fairways_in_round
     withNumberOf:(NSInteger)penalties_in_round
andNumberOfGreens:(NSInteger)in_regulation {
    
    self = [super init];
    
    if(self){
        course_name          = name;
        score                = score_in_round;
        putts                = putts_in_round;
        fairways             = fairways_in_round;
        penalties            = penalties_in_round;
        greens_in_regulation = in_regulation;
        holes_for_round      = [[NSMutableArray alloc] init];
        did_count_holes      = NO;
    }
    
    return self;
}


/**
 Defualt constructor for a Round object
 */
- (id)   init{
    self = [super init];
    
    if(self){
        course_name          = nil;
        score                = 0;
        putts                = 0;
        fairways             = 0;
        penalties            = 0;
        greens_in_regulation = 0;
        holes_for_round      = [[NSMutableArray alloc] init];
        did_count_holes      = NO;
    }
    
    return self;
}


/**
 
 
 @param score_num
 @param putts_num
 @param fairway_num
 @param penalties_num
 @param green_in_reg
 @param hole_num
 */
- (void) addHoleScore:(NSInteger)score_num
                putts:(NSInteger)putts_num
              fairway:(NSInteger)fairway_num
            penatlies:(NSInteger)penalties_num
             andGreen:(NSInteger)green_in_reg
              forHole:(NSInteger)hole_num{
    
    Hole *new_hole = [[Hole alloc] initWithScore:score_num putts:putts_num fairways:fairway_num penalties:penalties_num andGreens:green_in_reg atHoleNumber:hole_num];
    
    [holes_for_round addObject:new_hole];
}


/**
 
 */
- (void) calcTotalForRound{
    if(did_count_holes == NO){
        [self calcTotalScore];
        [self calcTotalPutts];
        [self calcTotalPenalties];
        [self calcTotalGreens];
        [self calcTotalFairway];
        
        did_count_holes = YES;
    }
}


/**
 
 */
- (void) calcTotalScore{
    for (Hole *hole in holes_for_round) {
        score += hole.score;
    }
}


/**
 
 */
- (void) calcTotalPutts{
    for (Hole *hole in holes_for_round) {
        putts += hole.putts;
    }
}

/**
 
 */
- (void) calcTotalFairway{
    for (Hole *hole in holes_for_round) {
        fairways += hole.fairway;
    }
}


/**
 
 */
- (void) calcTotalPenalties{
    for (Hole *hole in holes_for_round) {
        penalties += hole.penalties;
    }
}


/**
 
 */
- (void) calcTotalGreens{
    for (Hole *hole in holes_for_round) {
        greens_in_regulation += hole.green_in_regulation;
    }
}


/**
 
 
 @param hole_number
 @return
 */
- (Hole *) findHoleNumber:(NSInteger)hole_number{
    for(Hole *hole in holes_for_round){
        if(hole.hole_number == hole_number)
            return hole;
    }
    
    return nil;
}


/**
 
 
 @param hole_number
 */
- (void) removeHoleNumber:(NSInteger)hole_number{
    for (Hole *hole in holes_for_round){
        if(hole.hole_number == hole_number)
            [holes_for_round removeObject:hole];
    }
}

@end
