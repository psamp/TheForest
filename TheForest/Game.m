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
    Character *lawdZoldymorp = [[Character alloc] initWithName:@"Lawd Zoldymorp"];
    
    [Game duel: player enemy:lawdZoldymorp];
}

+ (void)duel:(Character *)player enemy:(Character *)enemy {
    NSLog(@"Enemy HP: %@", @([enemy healthPoints]));
    NSLog(@"Enemy MP: %@", @([enemy manaPoints]));
    NSLog(@"Player HP: %@", @([player healthPoints]));
    NSLog(@"Player MP: %@", @([player manaPoints]));
    NSLog(@"\n");
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        if (([player manaPoints] == 0 || [enemy manaPoints] == 0)) {
            break;
        }
        
        [enemy setHealthPoints: [enemy healthPoints] - [player attack:arc4random_uniform(3)]];
        [player setHealthPoints: [player healthPoints] - [enemy attack:arc4random_uniform(3)]];
        NSLog(@"\n\n");
        
        NSLog(@"%@ HP: %@", [enemy name],@([enemy healthPoints]));
        NSLog(@"%@ MP: %@", [enemy name],@([enemy manaPoints]));
        NSLog(@"\n");
        
        NSLog(@"%@ HP: %@", [player name],@([player healthPoints]));
        NSLog(@"%@ MP: %@", [player name],@([player manaPoints]));
        NSLog(@"\n");
    }
    
    if ([player healthPoints] == [enemy healthPoints]) {
        NSLog(@"The duel was a tie.");
    } else if([player healthPoints] > [enemy healthPoints]) {
        NSLog(@"%@ won the duel.", [player name]);
    } else {
        NSLog(@"%@ won the duel.", [enemy name]);
    }
    
}

@end
