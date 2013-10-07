//
//  Hole.m
//  iGolf
//
//  Created by Jacob Fuss on 4/24/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import "Hole.h"

@implementation Hole


- (id) init{
    self = [super init];
    
    if(self) {
        self.score               = 0;
        self.putts               = 0;
        self.fairway             = 0;
        self.penalties           = 0;
        self.green_in_regulation = 0;
        self.hole_number         = 0;
    }
    return self;
}


- (id) initWithScore:(NSInteger)score_num
               putts:(NSInteger)putts_num
            fairways:(NSInteger)fairways_num
           penalties:(NSInteger)penalties_num
           andGreens:(NSInteger)greens_num
        atHoleNumber:(NSInteger)hole_num{
    
    self = [super init];
    if(self){
        self.score               = score_num;
        self.putts               = putts_num;
        self.fairway             = fairways_num;
        self.penalties           = penalties_num;
        self.green_in_regulation = greens_num;
        self.hole_number         = hole_num;
        
    }
    
    return self;
}

@end
