//
//  Round.h
//  iGolf
//
//  Created by Jacob Fuss on 4/11/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hole.h"

@interface Round : NSObject{
    NSMutableArray  *holes_for_round;
    NSString        *course_name;
    NSInteger       score;
    NSInteger       putts;
    NSInteger       fairways;
    NSInteger       penalties;
    NSInteger       greens_in_regulation;
    BOOL            did_count_holes;
}

@property (nonatomic, retain) NSMutableArray *holes_for_round;
@property (nonatomic, retain) NSString       *course_name;
@property (nonatomic, assign) NSInteger      score;
@property (nonatomic, assign) NSInteger      putts;
@property (nonatomic, assign) NSInteger      fairways;
@property (nonatomic, assign) NSInteger      penalties;
@property (nonatomic, assign) NSInteger      greens_in_regulation;

- (id)   initWith:(NSString *)name
  numberOfStrokes:(NSInteger)score_in_round
         numberOf:(NSInteger)putts_in_round
  withNumberOfHit:(NSInteger)fairways_in_round
     withNumberOf:(NSInteger)penalties_in_round
andNumberOfGreens:(NSInteger)in_regulation;

- (void) addHoleScore:(NSInteger)score_num
                putts:(NSInteger)putts_num
              fairway:(NSInteger)fairway_num
            penatlies:(NSInteger)penatlies_num
             andGreen:(NSInteger)green_in_reg
              forHole:(NSInteger)hole_num;

- (void) calcTotalForRound;

- (Hole *) findHoleNumber:(NSInteger)hole_number;

- (void) removeHoleNumber:(NSInteger)hole_number;

@end
