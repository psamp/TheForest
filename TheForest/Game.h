//
//  Game.h
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

@interface Game : NSObject

+ (void)start;

+ (void)duel:(Character *)player enemy:(Character *)enemy;

@end
