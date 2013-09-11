//
//  StatisticAnlaysis.m
//  iGolf
//
//  Created by Jacob Fuss on 3/20/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "StatisticAnlaysis.h"
#import "Course.h"
#import "Round.h"

@interface StatisticAnlaysis () //note the empty category name

- (NSArray *) findFiveLowestScores:(const NSMutableDictionary *)courses_played;

- (int) findBiggestScore:(NSMutableArray *)lowest_five;

@end

/**
 StatisticAnlaysis class holds data structures that all golf stats will be saved and the functions
 that will be used to get the statistics for each round
 */
@implementation StatisticAnlaysis


/**
 Defualt Constructor for the Statistic Anlaysiser class
 
 @return
        The Statistic Anlaysiser id
 */
- (id) init{
    self = [super init];
    
    if(self){
        self.lowest_round =  NSIntegerMax;
    }
    
    return self;
}


/**
 Calculates the handicap from all the rounds played
 
 @param courses_played
                A dictionary of all the courses the golfer has played
 @return
        The handicap of the golfer
 @note handicap and diffential must be double's to account for rounding errors
 */
- (int) calcHandicapFrom:(const NSMutableDictionary *)courses_played{
    double handicap = 0;
    double differential = 1000;
    
    // Handicap can only be caclulated if there are at least 5 rounds
    if ( [self isAtLeastFive:courses_played] ) {
        NSArray *lowest_five_scores = [self findFiveLowestScores:courses_played];
        
        // Iterate through the lowest 5 rounds
        for (int iter = 0; iter < 5; iter++){
            Round *current_round = [lowest_five_scores objectAtIndex:iter];
            Course *current_course = [courses_played objectForKey:current_round.course_name];
            
            // NULL check (@see init @file round.m)
            // Only do math if there is a score
            if (current_round.score != 0){
                int rating = current_course.course_rating;
                int slope = current_course.course_slope;
                
                // @note 133 is a number the USGA sets
                double current_differential = (double) (((current_round.score - rating) / (double) slope)  * 113.0);
                
                // Find lowest differential
                if (differential > current_differential)
                    differential = current_differential;
            }
        }
        
    }
    
    if (differential < 1000) {
        // @note .96 is a number the USGA sets
        handicap = differential * .96;
    }
    // Not enough rounds to calculate Handicap
    return (int) handicap;
}


/**
 Finds the lowest five scores for all the rounds played
 
 @param courses_played
                     A dictionary of all the courses the golfer has played
 @return
                    An array with the five lowest Round objects stored
 */
- (NSArray *) findFiveLowestScores:(const NSMutableDictionary *)courses_played{
    Round *course1 = [[Round alloc] init];
    Round *course2 = [[Round alloc] init];
    Round *course3 = [[Round alloc] init];
    Round *course4 = [[Round alloc] init];
    Round *course5 = [[Round alloc] init];
    
    NSMutableArray *lowest_five = [NSMutableArray arrayWithObjects:course1, course2, course3, course4, course5, nil];
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_rounds = course.rounds_for_course;
        
        for (Round *round in all_rounds) {
            [round calcTotalForRound];
            int index = [self findBiggestScore:lowest_five];
            
            Round *round_to_replace = [lowest_five objectAtIndex:index];
            if (round_to_replace.score == 0){
                [lowest_five removeObjectAtIndex:index];
                [lowest_five addObject:round];
            }
            else if (round_to_replace.score >= round.score){
                [lowest_five removeObjectAtIndex:index];
                [lowest_five addObject:round];
            }
            else{
                /* current round is larger then the biggest one already in the array (lowest_five) */
                /* Do Nothing */
            }
        }
    }
    
    // Make the mutable array non-mutable
    NSArray *return_array = [[NSArray alloc] initWithArray:lowest_five];
    return return_array;
}


/**
 Finds the largest score in an array of Round objects
 
 @param lowest_five
                An array of Round objects
 @return
                An index to where the largest score is located
 */
- (int) findBiggestScore:(NSMutableArray *)lowest_five{
    NSInteger highest_score = 0;
    int index_to_return = -1;
    
    // Iterate through the array to find the biggest score
    // If an index is nil return that index
    for(int iter = 0; iter < 5; iter++){
        Round *current_round = [lowest_five objectAtIndex:iter];
        if (current_round.score == 0){
            return iter;
        }
        
        // In a ties it takes the most recent score
        if (highest_score <= current_round.score) {
            highest_score = current_round.score;
            index_to_return = iter;
        }
    }
    
    // Error case = -1
    return index_to_return;
}


/**
 Determines if there are a least five rounds of golf played
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return    
                    YES if there are at least 5 rounds otherwise NO
 */
- (BOOL) isAtLeastFive:(const NSMutableDictionary *)courses_played{
    int total_rounds_played = 0;
    
    for (id key in courses_played){
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_rounds = course.rounds_for_course;
        
        for (Round *round in all_rounds){
            total_rounds_played++;
        }
        
        if (total_rounds_played != 0){
            return YES;
        }
        
    }
    
    
    return NO;
}


/**
 Calculates the average number of strokes per round

 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return
                    The average number of strokes per round
 */
- (float) calcAverageRoundFrom:(NSMutableDictionary *)courses_played{
    float running_average = 0;
    float total_dict_length = 0;
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_rounds = course.rounds_for_course;
        
        for (Round *round in all_rounds) {
            [round calcTotalForRound];
            running_average += round.score;
            total_dict_length++;
        }
    }
    
    if (total_dict_length <= 0) {
        return 0.0;
    }
    else{
        return (running_average / total_dict_length);
    }
}


/**
 Calculates the average number of putts per round
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return
                    The average number of putts per round
 */
- (float) calcAveragePuttsFrom:(NSMutableDictionary *)courses_played{
    float running_average = 0;
    float total_dict_length = 0;
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_putts = course.rounds_for_course;
        
        for (Round *round in all_putts) {
            [round calcTotalForRound];
            running_average += round.putts;
            total_dict_length++;
            
        }
    }
    
    if (total_dict_length <= 0) {
        return 0.0;
    }
    else{
        return (running_average / total_dict_length);
    }
}


/**
 Calculates the average number of fairways hit per round
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return
                    The average number of fairways hit per round
 */
- (float) calcAverageFairwaysFrom:(NSMutableDictionary *)courses_played{
    float running_average = 0;
    float total_dict_length = 0;
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_fairways = course.rounds_for_course;
        
        for (Round *round in all_fairways) {
            [round calcTotalForRound];
            running_average += round.fairways;
            total_dict_length++;
            
        }
    }
    
    if (total_dict_length <= 0) {
        return 0.0;
    }
    else{
        return (running_average / total_dict_length);
    }
}


/**
 Calculates the average number of penalties per round
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return
                    The average number of penalties per round
 */
- (float) calcAveragePenaltiesFrom:(NSMutableDictionary *)courses_played{
    float running_average = 0;
    float total_dict_length = 0;
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_penalties = course.rounds_for_course;
        
        for (Round *round in all_penalties) {
            [round calcTotalForRound];
            running_average += round.penalties;
            total_dict_length++;
            
        }
    }
    
    if (total_dict_length <= 0) {
        return 0.0;
    }
    else{
        return (running_average / total_dict_length);
    }
}


/**
 Calculates the average number of greens hit in regulation
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @return
                    The average number of greens hit in regulation per round
 */
- (float) calcAverageGreensFrom:(NSMutableDictionary *)courses_played{
    float running_average = 0;
    float total_dict_length = 0;
    
    for(id key in courses_played) {
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_greens = course.rounds_for_course;
        
        for (Round *round in all_greens) {
            [round calcTotalForRound];
            running_average += round.greens_in_regulation;
            total_dict_length++;
            
        }
    }
    
    if (total_dict_length <= 0) {
        return 0.0;
    }
    else{
        return (running_average / total_dict_length);
    }
}


/**
 Finds the lowest score/ round a golfer has had
 
 @param courses_played
                    A dictionary of all the courses the golfer has played
 @param lowestRoundToDate
                    A dictionary of all the rounds played
 */
- (void) findLowestRoundToDate:(NSMutableDictionary *)courses_played{
    for (id key in courses_played){
        Course *course = [courses_played objectForKey:key];
        NSMutableArray *all_scores = course.rounds_for_course;
        
        for (Round *round in all_scores){
            [round calcTotalForRound];
            
            if (round.score < self.lowest_round){
                self.lowest_round = round.score;
            }
        }
    }
    
    if (self.lowest_round == NSIntegerMax) {
        self.lowest_round = 0;
    }
}

@end
