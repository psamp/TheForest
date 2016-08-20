//
//  Game.m
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Game.h"
#import "UserInput.h"
#import "Spell.h"

@implementation Game

+ (void)start {
    Character *player = [[Character alloc] initWithName:getStringFromUser(30, @"What is your name?")];
    Character *lawdZoldymorp = [[Character alloc] initWithName:@"Lawd Zoldymorp"];
    
    [Game duel: player enemy:lawdZoldymorp];
}

+ (void)duel:(Character *)player enemy:(Character *)enemy {
    
    NSNumber *startingHealth = @([player healthPoints]);
    NSNumber *startingMana = @([player manaPoints]);
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        
        if (([player manaPoints] == 0 || [enemy manaPoints] == 0)) {
            break;
        }
        
        for (int i = 0; i < [[player spells] count]; i++) {
            Spell *spell = [[player spells] objectAtIndex:i];
            NSLog(@"%@: %@ - %@ (%@ mana)", @(i), [spell name],[spell effect], @([spell manaCost]));
        }
        
        [enemy setHealthPoints: [enemy healthPoints] - [player attack:getNumberFromUser(2, @"Enter the spell you'd like to cast:")]];
        [player setHealthPoints: [player healthPoints] - [enemy attack:arc4random_uniform(3)]];
        
        NSLog(@"\n");
        NSLog(@"%@ HP: %@/%@", [enemy name],@([enemy healthPoints]), startingHealth);
        NSLog(@"%@ MP: %@/%@", [enemy name],@([enemy manaPoints]), startingMana);
        NSLog(@"\n");
        
        NSLog(@"%@ HP: %@/%@", [player name],@([player healthPoints]), startingHealth);
        NSLog(@"%@ MP: %@/%@", [player name],@([player manaPoints]), startingMana);
        NSLog(@"\n");
    }
    
    [Game determineWinner:player enemy:enemy];
    
}

+ (void)determineWinner:(Character *)player enemy:(Character *)enemy {
    if ([player healthPoints] == [enemy healthPoints]) {
        NSLog(@"The duel was a tie.");
    } else if([player healthPoints] > [enemy healthPoints]) {
        NSLog(@"%@ won the duel.", [player name]);
    } else {
        NSLog(@"%@ won the duel.", [enemy name]);
    }
}

@end
