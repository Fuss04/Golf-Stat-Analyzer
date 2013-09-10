//
//  iGolfTests.m
//  iGolfTests
//
//  Created by Jacob Fuss on 3/19/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "iGolfTests.h"
#import "StatisticAnlaysis.h"
#import "Round.h"
#import "Course.h"
#import "Hole.h"

/**
 Tests for iGolf
 */
@implementation iGolfTests

/**
 Sets up tests before any tests are run
 */
- (void) setUp{
    [super setUp];
    
    // Set-up code here.
}


/**
 Tears down tests after they all run
 */
- (void) tearDown{
    // Tear-down code here.
    
    [super tearDown];
}


/**
 Tests to make sure a Round Object is constructed correctly 
 */
- (void) testRound{
    Round *round = [[Round alloc] initWith:@"OFCC" numberOfStrokes:79 numberOf:20 withNumberOfHit:10 withNumberOf:0 andNumberOfGreens:14];
    
    STAssertEquals(round.course_name, @"OFCC", @"Not the correct course name");
    STAssertEquals(round.score, 79, @"Not the correct number of strokes (score)");
    STAssertEquals(round.putts, 20, @"Not the correct number of putts");
    STAssertEquals(round.fairways, 10, @"Not the correct number of fairways hit");
    STAssertEquals(round.penalties, 0, @"Not the correct number of penalties");
    STAssertEquals(round.greens_in_regulation, 14, @"Not the correct greens in regulation");
}


/**
 Tests to make sure a Course Object is constructed correctly
 */
- (void) testCourse{
    Course *course = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    
    STAssertEquals(course.course_name, @"OFCC", @"Not the correct course name");
    STAssertEquals(course.course_slope, 120, @"Not the correct slope");
    STAssertEquals(course.course_rating, 71, @"Not the correct rating");
}


/**
 Tests to make sure the adding function for each structure is working properly
 */
- (void) testAddingStats{
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    NSInteger max =  NSIntegerMax;
    
    STAssertEquals(stats.lowest_round,  max, @"Not the right starting value for lowest_round");

    stats.lowest_round = 79;
    STAssertEquals(stats.lowest_round, 79, @"Not the correct value for lowest_round");
}


/**
 Tests to see if the aveerage score is correct for the rounds that have been added
 */
- (void) testAveragesScore{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    float average = [stats calcAverageRoundFrom:all_data];
    float correct_average = (79 + 80 + 89) / 3.0;
    
    STAssertEquals(average, correct_average, @"Not the correct average of strokes per round");
}


/**
 Tests to see if the average fairways hit is correct for the rounds that have been added
 */
- (void) testAverageFairways{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    float average = [stats calcAverageFairwaysFrom:all_data];
    float correct_average = (10 + 9 + 3) / 3.0;
    
    STAssertEquals(average, correct_average, @"Not the correct average of fairways per round");
}


/**
 Tests to see if the average greens in regulation is correct for the rounds that have been added
 */
- (void) testAverageGreens{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    float average = [stats calcAverageGreensFrom:all_data];
    float correct_average = (14 + 10 + 4) / 3.0;
    
    STAssertEquals(average, correct_average, @"Not the correct average of greens in regulation per round");
}


/**
 Tests to see if the average penalties is correct for the rounds that have been added
 */
- (void) testAveragePenalties{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    float average = [stats calcAveragePenaltiesFrom:all_data];
    float correct_average = (0 + 0 + 1) / 3.0;
    
    STAssertEquals(average, correct_average, @"Not the correct average of penalties per round");
}


/**
 Tests to see if the average putts is correct for the rounds that have been added
 */
- (void) testAveragePutts{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    float average = [stats calcAveragePuttsFrom:all_data];
    float correct_average = (20 + 38 + 30) / 3.0;
    
    STAssertEquals(average, correct_average, @"Not the correct average of putts per round");
}


/**
 Test to see if the lowest round after 3 rounds are added
 */
- (void) testLowestScoreToDate{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    [stats findLowestRoundToDate:all_data];
    
    STAssertEquals(stats.lowest_round, 79, @"Not the correct lowest round to date");
}


/**
 Tests to see if the correct handicap is calculated
 */
- (void) testHandicap{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    
    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    
    int handicap = [stats calcHandicapFrom:all_data];
    int correct_handicap = ((((79 - 71) / 120.0) * 113.0) * .96);
    
    STAssertEquals(handicap, correct_handicap, @"Not the correct handicap");
}


/**
 Tests to make sure when getting handicap that none of the data is changed
 */
- (void) testEverythingAtOnce{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    Course *ggcc = [[Course alloc] initWith:@"GGCC" difficulty:130 and:70];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:79 toRoundWithNumber:20 numberOfHit:10 numberOf:0 andNumberOfGreens:14];
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    [ggcc add:76 toRoundWithNumber:28 numberOfHit:12 numberOf:0 andNumberOfGreens:15];
    [beverly add:80 toRoundWithNumber:40 numberOfHit:2 numberOf:9 andNumberOfGreens:4];
    [ofcc add:76 toRoundWithNumber:25 numberOfHit:12 numberOf:0 andNumberOfGreens:8];

    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    [all_data setObject:ggcc forKey:@"GGCC"];
    
    int handicap = [stats calcHandicapFrom:all_data];
    int correct_handicap = (int) ((((76 - 71) / 120.0) *113.0) * .96);
    STAssertEquals(handicap, correct_handicap, @"Not the correct handicap");
    
    float average = [stats calcAverageGreensFrom:all_data];
    float correct_average = (14 + 10 + 4 + 15 + 4 + 8) / 6.0;
    STAssertEquals(average, correct_average, @"Not the correct average of greens");
    
    average = [stats calcAverageRoundFrom:all_data];
    correct_average = (79 + 80 + 89 + 76 + 80 + 76) / 6.0;
    STAssertEquals(average, correct_average, @"Not the correct average round");
}


/**
 Test Constructor of Hole Object
 @note
    This test is a SANITY CHECK!!!
 */
- (void) testHole{
    Hole *new_hole = [[Hole alloc] init];
    STAssertEquals(new_hole.score, 0, @"Not the correct default score");
    STAssertEquals(new_hole.putts, 0, @"Not the correct default putts");
    STAssertEquals(new_hole.penalties, 0, @"Not the correct defualt penalties");
    STAssertEquals(new_hole.fairway, 0, @"Not the correct defualt fairway");
    STAssertEquals(new_hole.green_in_regulation, 0, @"Not the correct defualt green in regulation");
    STAssertEquals(new_hole.hole_number, 0, @"Not the correct defualt hole number");
    
    Hole *another_hole = [[Hole alloc] initWithScore:4 putts:2 fairways:1 penalties:0 andGreens:1 atHoleNumber:1];
    STAssertEquals(another_hole.score, 4, @"Not the correct default score");
    STAssertEquals(another_hole.putts, 2, @"Not the correct default putts");
    STAssertEquals(another_hole.penalties, 0, @"Not the correct defualt penalties");
    STAssertEquals(another_hole.fairway, 1, @"Not the correct defualt fairway");
    STAssertEquals(another_hole.green_in_regulation, 1, @"Not the correct defualt green in regulation");
    STAssertEquals(another_hole.hole_number, 1, @"Not the correct defualt hole number");
}


/**
 Test the functions that calculate the totals for a give round
 */
- (void) testRoundCalcFunctions{
    Round *new_round = [[Round alloc] init];
    Hole *hole_one = [[Hole alloc] initWithScore:4 putts:5 fairways:0 penalties:0 andGreens:2 atHoleNumber:1];
    Hole *hole_two = [[Hole alloc] initWithScore:5 putts:2 fairways:1 penalties:1 andGreens:0 atHoleNumber:2];
    
    [new_round.holes_for_round addObject:hole_one];
    [new_round.holes_for_round addObject:hole_two];
    
    [new_round calcTotalForRound];
    int number_of_holes = [new_round.holes_for_round count];
    
    STAssertEquals(new_round.score, 9, @"Not the correct total score");
    STAssertEquals(new_round.putts, 7, @"Not the correct total for  putts");
    STAssertEquals(new_round.penalties, 1, @"Not the correct total for penalties");
    STAssertEquals(new_round.fairways, 1, @"Not the correct total for fairway");
    STAssertEquals(new_round.greens_in_regulation, 2, @"Not the correct total for green in regulation");
    STAssertEquals(number_of_holes, 2, @"Not the correct number of holes");
}


/**
 Tests the stats with using Holes that are stored in the Round object
 */
- (void) testStatsWithHoleImplemented{
    Round *new_round = [[Round alloc] init];
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    
    Hole *hole_one = [[Hole alloc] initWithScore:4 putts:5 fairways:0 penalties:0 andGreens:2 atHoleNumber:1];
    Hole *hole_two = [[Hole alloc] initWithScore:5 putts:2 fairways:1 penalties:1 andGreens:0 atHoleNumber:2];
    
    [new_round.holes_for_round addObject:hole_one];
    [new_round.holes_for_round addObject:hole_two];
    
    [ofcc addRound:new_round];
    [all_data setObject:ofcc forKey:@"OFCC"];
    
    float average = [stats calcAverageGreensFrom:all_data];
    float correct_average = 2 / 1.0;
    STAssertEquals(average, correct_average, @"Not the correct green average");
    
    average = [stats calcAverageFairwaysFrom:all_data];
    correct_average = 1 / 1.0;
    STAssertEquals(average, correct_average, @"Not the correct fairway average");
    
    average = [stats calcAveragePenaltiesFrom:all_data];
    correct_average = 1 / 1.0;
    STAssertEquals(average, correct_average, @"Not the correct penalty average");
    
    average = [stats calcAveragePuttsFrom:all_data];
    correct_average = 7 / 1.0;
    STAssertEquals(average, correct_average, @"Not the correct putt average");
    
    average = [stats calcAverageRoundFrom:all_data];
    correct_average = 9 / 1.0;
    STAssertEquals(average, correct_average, @"Not the correct stroke average");
}


/**
 Tests the handicap function when Holes are stored in the Round object
 */
- (void) testHandicapWithHoleImplented{
    NSMutableDictionary *all_data = [[NSMutableDictionary alloc] init];
    Course *ofcc = [[Course alloc] initWith:@"OFCC" difficulty:120 and:71];
    Course *beverly = [[Course alloc] initWith:@"Beverly" difficulty:120 and:71];
    Course *ggcc = [[Course alloc] initWith:@"GGCC" difficulty:130 and:70];
    StatisticAnlaysis *stats = [[StatisticAnlaysis alloc] init];
    
    [ofcc add:80 toRoundWithNumber:38 numberOfHit:9 numberOf:0 andNumberOfGreens:10];
    [beverly add:89 toRoundWithNumber:30 numberOfHit:3 numberOf:1 andNumberOfGreens:4];
    [ggcc add:76 toRoundWithNumber:28 numberOfHit:12 numberOf:0 andNumberOfGreens:15];
    [beverly add:80 toRoundWithNumber:40 numberOfHit:2 numberOf:9 andNumberOfGreens:4];
    [ofcc add:76 toRoundWithNumber:25 numberOfHit:12 numberOf:0 andNumberOfGreens:8];
    
    Hole *hole_one = [[Hole alloc] initWithScore:70 putts:15 fairways:5 penalties:0 andGreens:10 atHoleNumber:1];
    Hole *hole_two = [[Hole alloc] initWithScore:5 putts:1 fairways:1 penalties:0 andGreens:1 atHoleNumber:2];
    Hole *hole_three = [[Hole alloc] initWithScore:1 putts:1 fairways:1 penalties:0 andGreens:1 atHoleNumber:3];
    Hole *hole_four = [[Hole alloc] initWithScore:3 putts:3 fairways:3 penalties:0 andGreens:2 atHoleNumber:4];
    
    Round *new_round = [[Round alloc] init];
    [new_round.holes_for_round addObject:hole_one];
    [new_round.holes_for_round addObject:hole_two];
    [new_round.holes_for_round addObject:hole_three];
    [new_round.holes_for_round addObject:hole_four];
    [ofcc addRound:new_round];

    [all_data setObject:ofcc forKey:@"OFCC"];
    [all_data setObject:beverly forKey:@"Beverly"];
    [all_data setObject:ggcc forKey:@"GGCC"];
    
    int handicap = [stats calcHandicapFrom:all_data];
    int correct_handicap = (int) ((((76 - 71) / 120.0) *113.0) * .96);
    STAssertEquals(handicap, correct_handicap, @"Not the correct handicap");
    
    float average = [stats calcAverageGreensFrom:all_data];
    float correct_average = (14 + 10 + 4 + 15 + 4 + 8) / 6.0;
    STAssertEquals(average, correct_average, @"Not the correct average of greens");
    
    average = [stats calcAverageRoundFrom:all_data];
    correct_average = (79 + 80 + 89 + 76 + 80 + 76) / 6.0;
    STAssertEquals(average, correct_average, @"Not the correct average round");
}

@end
