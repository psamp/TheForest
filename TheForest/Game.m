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
    
    NSLog(@"Greetings, %@. You have summmoned by %@ to fight for the fate of the Magical World.", [player name], [lawdZoldymorp name]);
    NSLog(@"He's evil, very bad, no good, etc. But still, you have a choice...");
    
    if(getNumberFromUser(2, @"Do you wish to fight him? Enter 1 for yes, 0 for no.") == 0) {
        NSLog(@"SIKE! *cough* Okay, you don't have a choice.");
        NSLog(@"We'd find another Chosen One, but there's only ever one of you at a time. Awkward.");
    }
    
    NSLog(@"Oh, there he is! Hello, Mr. %@. Right on time... ha...", [lawdZoldymorp name]);
    NSLog(@"*whispering* He's all bark, no bite. If you can conserve your mana, but still fight him, he'll respect you and leave everyone alone for a while.\n");
    NSLog(@"Well, probably more like a week. Anyway, if you have more magic left than him at the end of all this, you win! Good luck...\n\n");
    
    
    [Game duel: player enemy:lawdZoldymorp];
}

+ (void)duel:(Character *)player enemy:(Character *)enemy {
    
    while ([player healthPoints] != 0 && [enemy healthPoints] != 0) {
        if ([player manaPoints] < 40 || [enemy manaPoints] < 40) {
            break;
        }
        
        for (int i = 0; i < [[player spells] count]; i++) {
            Spell *spell = [[player spells] objectAtIndex:i];
            NSLog(@"%@: %@ - %@ (%@ mana/damage)", @(i), [spell name],[spell effect], @([spell manaCost]));
        }
        
        NSInteger enemyAttack = arc4random_uniform((int) [[enemy spells] count]);
        [player setHealthPoints: [player healthPoints] - [enemy attack:enemyAttack]];
        
        NSInteger playerAttack = getNumberFromUser((int)[[player spells] count], @"Enter the number of the spell you'd like to cast:");
        [enemy setHealthPoints: [enemy healthPoints] - [player attack:playerAttack]];
        
        NSLog(@"\n");
        [Game displayCharacterStats:player startingHealthPoints:@([player maxHealthPoints]) startingManaPoints: @([player maxManaPoints])];
        [Game displayCharacterStats:enemy startingHealthPoints:@([enemy maxHealthPoints]) startingManaPoints: @([enemy maxManaPoints])];
        NSLog(@"\n");
    }
    
    [Game determineWinner:player enemy:enemy];
    
}

+ (void)determineWinner:(Character *)player enemy:(Character *)enemy {
    if ([player manaPoints] == [enemy manaPoints]) {
        NSLog(@"The duel was a tie.");
    } else if([player manaPoints] > [enemy manaPoints]) {
        NSLog(@"%@ won the duel. Awesome!", [player name]);
    } else {
        NSLog(@"%@ won the duel. We're all doomed.", [enemy name]);
    }
}

+ (void)displayCharacterStats:(Character *)character startingHealthPoints:(NSNumber *)startHP startingManaPoints:(NSNumber *)startMP {
    
    NSLog(@"%@ - %@/%@ HEALTH | %@/%@ MANA", [character name], @([character healthPoints]), startHP, @([character manaPoints]), startMP);
}


@end
