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
        self.course_name          = name;
        self.score                = score_in_round;
        self.putts                = putts_in_round;
        self.fairways             = fairways_in_round;
        self.penalties            = penalties_in_round;
        self.greens_in_regulation = in_regulation;
        self.holes_for_round      = [[NSMutableArray alloc] init];
        self.did_count_holes      = NO;
    }
    
    return self;
}


/**
 Defualt constructor for a Round object
 */
- (id)   init{
    self = [super init];
    
    if(self){
        self.course_name          = nil;
        self.score                = 0;
        self.putts                = 0;
        self.fairways             = 0;
        self.penalties            = 0;
        self.greens_in_regulation = 0;
        self.holes_for_round      = [[NSMutableArray alloc] init];
        self.did_count_holes      = NO;
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
    
    [self.holes_for_round addObject:new_hole];
}


/**
 
 */
- (void) calcTotalForRound{
    if(self.did_count_holes == NO){
        [self calcTotalScore];
        [self calcTotalPutts];
        [self calcTotalPenalties];
        [self calcTotalGreens];
        [self calcTotalFairway];
        
        self.did_count_holes = YES;
    }
}


/**
 
 */
- (void) calcTotalScore{
    for (Hole *hole in self.holes_for_round) {
        self.score += hole.score;
    }
}


/**
 
 */
- (void) calcTotalPutts{
    for (Hole *hole in self.holes_for_round) {
        self.putts += hole.putts;
    }
}

/**
 
 */
- (void) calcTotalFairway{
    for (Hole *hole in self.holes_for_round) {
        self.fairways += hole.fairway;
    }
}


/**
 
 */
- (void) calcTotalPenalties{
    for (Hole *hole in self.holes_for_round) {
        self.penalties += hole.penalties;
    }
}


/**
 
 */
- (void) calcTotalGreens{
    for (Hole *hole in self.holes_for_round) {
        self.greens_in_regulation += hole.green_in_regulation;
    }
}


/**
 
 
 @param hole_number
 @return
 */
- (Hole *) findHoleNumber:(NSInteger)hole_number{
    for(Hole *hole in self.holes_for_round){
        if(hole.hole_number == hole_number)
            return hole;
    }
    
    return nil;
}


/**
 
 
 @param hole_number
 */
- (void) removeHoleNumber:(NSInteger)hole_number{
    for (Hole *hole in self.holes_for_round){
        if(hole.hole_number == hole_number)
            [self.holes_for_round removeObject:hole];
    }
}

@end
