//
//  Hole.h
//  iGolf
//
//  Created by Jacob Fuss on 4/24/13.
//  Copyright (c) 2013 Jacob Fuss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hole : NSObject{

}

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger putts;
@property (nonatomic, assign) NSInteger fairway;
@property (nonatomic, assign) NSInteger penalties;
@property (nonatomic, assign) NSInteger green_in_regulation;
@property (nonatomic, assign) NSInteger hole_number;

- (id) initWithScore:(NSInteger)score
               putts:(NSInteger)putts
            fairways:(NSInteger)fairways
           penalties:(NSInteger)penalties
           andGreens:(NSInteger)greens
        atHoleNumber:(NSInteger)hole_number;

@end
