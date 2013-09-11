//
//  Course.h
//  iGolf
//
//  Created by Jacob Fuss on 4/11/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Round;

@interface Course : NSObject

@property (nonatomic, retain) NSMutableArray  *rounds_for_course;
@property (nonatomic, retain) NSMutableArray  *scorecard;
@property (nonatomic, retain) NSString        *course_name;
@property (nonatomic, assign) NSInteger       course_rating;
@property (nonatomic, assign) NSInteger       course_slope;


- (id) initWith:(NSString *)name difficulty:(NSInteger)slope and:(NSInteger)rating;

- (void)      add:(NSInteger)score
toRoundWithNumber:(NSInteger)putts
      numberOfHit:(NSInteger)fairways
         numberOf:(NSInteger)penalties
andNumberOfGreens:(NSInteger)in_regulation;

- (void) addRound:(Round *)new_round;

@end
