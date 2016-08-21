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
    
    [Game displayCharacterStats:player startingHealthPoints:startingHealth startingManaPoints: startingMana];
    NSLog(@"\n");
    
    [Game displayCharacterStats:enemy startingHealthPoints:startingHealth startingManaPoints: startingMana];
    NSLog(@"\n");
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        if (([player manaPoints] == 0 || [enemy manaPoints] == 0)) {
            break;
        }
        
        for (int i = 0; i < [[player spells] count]; i++) {
            Spell *spell = [[player spells] objectAtIndex:i];
            NSLog(@"%@: %@ - %@ (%@ mana)", @(i), [spell name],[spell effect], @([spell manaCost]));
        }
        
        NSLog(@"\n");
        [player setHealthPoints: [player healthPoints] - [enemy attack:arc4random_uniform((int) [[enemy spells] count])]];
        [enemy setHealthPoints: [enemy healthPoints] - [player attack:getNumberFromUser((int)[[player spells] count], @"Enter the number of the spell you'd like to cast:")]];
        
        NSLog(@"\n");
        [Game displayCharacterStats:player startingHealthPoints:startingHealth startingManaPoints: startingMana];
        NSLog(@"\n");
        
        [Game displayCharacterStats:enemy startingHealthPoints:startingHealth startingManaPoints: startingMana];
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

+ (void)displayCharacterStats:(Character *)character startingHealthPoints:(NSNumber *)startHP startingManaPoints:(NSNumber *)startMP{
    NSLog(@"%@ HP: %@/%@", [character name],@([character healthPoints]), startHP);
    NSLog(@"%@ MP: %@/%@", [character name],@([character manaPoints]), startMP);
}


@end
