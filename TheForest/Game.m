//
//  Game.m
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Game.h"
#import "UserInput.h"
#import <unistd.h>

@implementation Game

+ (void)start {
    Character *player = [[Character alloc] initWithName:getStringFromUser(30, @"What is your name?")];
    Character *lawdZoldymorp = [[Character alloc] initWithName:@"Lord Zoldymorp"];
    
    [Game duel: player enemy:lawdZoldymorp];
}

+ (void)duel:(Character *)player enemy:(Character *)enemy {
    NSLog(@"Player HP: %@", @([player healthPoints]));
    NSLog(@"Player MP: %@", @([player manaPoints]));
    NSLog(@"Enemy HP: %@", @([enemy healthPoints]));
    NSLog(@"Enemy MP: %@", @([enemy manaPoints]));
    NSLog(@"\n\n");
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        if (([player manaPoints] == 0 || [enemy manaPoints] == 0)) {
            break;
        }
        
        [enemy setHealthPoints: [enemy healthPoints] - [player attack]];
        [player setHealthPoints: [player healthPoints] - [enemy attack]];
        
        NSLog(@"Player HP: %@", @([player healthPoints]));
        NSLog(@"Player MP: %@", @([player manaPoints]));
        NSLog(@"Enemy HP: %@", @([enemy healthPoints]));
        NSLog(@"Enemy MP: %@", @([enemy manaPoints]));
        NSLog(@"\n\n");
    }
}

@end
