//
//  Character.m
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Character.h"
#import "Spell.h"

@implementation Character

- (instancetype)initWithName:(NSString *)name {
    if (name == nil) {
        return nil;
    }
    
    self = [super init];
    
    if (self) {
        _name = name;
        
        _maxHealthPoints = 600;
        _maxManaPoints = 450;
        
        _healthPoints = _maxHealthPoints;
        _manaPoints = _maxManaPoints;
        
        _spells = [NSMutableArray array];
        [_spells addObject: [[Spell alloc] initWithName:@"Flipendo" effect:@"knockback spell" manaCost:40]];
        [_spells addObject: [[Spell alloc] initWithName:@"Diffindo" effect:@"severing charm" manaCost:80]];
        [_spells addObject: [[Spell alloc] initWithName:@"Incendio" effect:@"shoots fire-ball" manaCost:180]];
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithName:nil];
}

- (NSInteger)attack:(NSInteger)spellIndex {
    Spell * spell = _spells[spellIndex];
    
    if ([self manaPoints] < [_spells[spellIndex] manaCost]) {
        NSLog(@"%@ does not have enough mana for %@ (%@ mana)", [self name], [spell name], @([spell manaCost]));
        return 0;
    }
    
    NSLog(@"%@ cast %@", [self name], [_spells[spellIndex] name]);
    [self setManaPoints: [self manaPoints] - [spell manaCost]];
    
    return [spell manaCost];
}

- (void)setHealthPoints:(NSInteger)healthPoints {
    _healthPoints = MAX(healthPoints, 0);
}

- (void)setManaPoints:(NSInteger)manaPoints {
    _manaPoints = MAX(manaPoints, 0);
}

@end
