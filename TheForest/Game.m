//
//  Game.m
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Game.h"
#import "UserInput.h"

@implementation Game

+ (void)start {
    Character *player = [[Character alloc] initWithName:getStringFromUser(30, @"What is your name?")];
    Character *lawdZoldymorp = [[Character alloc] initWithName:@"Lord Zoldymorp"];
    
    [Game duel: player enemy:lawdZoldymorp];
    
}

+ (void)duel:(Character *)player enemy:(Character *)enemy {
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        [player setHealthPoints: [player healthPoints] - [enemy attack]];
        [enemy setHealthPoints: [enemy healthPoints] - [player attack]];
        
        NSLog(@"Player HP: %@", @([player healthPoints]));
        NSLog(@"Enemy HP: %@", @([enemy healthPoints]));
    }
}

@end
