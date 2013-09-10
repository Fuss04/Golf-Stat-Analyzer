//
//  StatisticAnlaysis.h
//  iGolf
//
//  Created by Jacob Fuss on 3/20/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticAnlaysis : NSObject{
    NSInteger lowest_round;
}


@property (nonatomic, assign) NSInteger lowest_round;


- (int) calcHandicapFrom:(const NSMutableDictionary *)courses_played;

- (float) calcAverageRoundFrom:(NSMutableDictionary *)courses_played;

- (float) calcAveragePuttsFrom:(NSMutableDictionary *)courses_played;

- (float) calcAverageFairwaysFrom:(NSMutableDictionary *)courses_played;

- (float) calcAveragePenaltiesFrom:(NSMutableDictionary *)courses_played;

- (float) calcAverageGreensFrom:(NSMutableDictionary *)courses_played;

- (void) findLowestRoundToDate:(NSMutableDictionary *)courses_played;

@end
