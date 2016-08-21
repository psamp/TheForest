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
        _healthPoints = 200;
        _manaPoints = 150;
        
        _spells = [NSMutableArray array];
        [_spells addObject: [[Spell alloc] initWithName:@"Flipendo" effect:@"knockback" manaCost:10]];
        [_spells addObject: [[Spell alloc] initWithName:@"Diffindo" effect:@"shield charm" manaCost:20]];
        [_spells addObject: [[Spell alloc] initWithName:@"Incendio" effect:@"shoots fire-ball" manaCost:20]];
        [_spells addObject: [[Spell alloc] initWithName:@"Protego" effect:@"shield charm" manaCost:40]];
        
        _shieldPoints = 0;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithName:nil];
}

- (NSInteger)attack:(NSInteger)spellIndex {
    if (_manaPoints == 0) {
        NSLog(@"You are out of mana");
        return 0;
    }
    
    Spell * spell = _spells[spellIndex];
    NSLog(@"%@ cast %@", _name, [_spells[spellIndex] name]);
    
    [self setManaPoints: _manaPoints - [spell manaCost]];

    if ([[spell name]  isEqual: @"Protego"]) {
        [self setShieldPoints: [self shieldPoints] + 20];
        return 0;
    }

    return [spell manaCost];
}

- (void)setHealthPoints:(NSInteger)healthPoints {
    _healthPoints = MAX(healthPoints, 0) + [self shieldPoints];
    
}

- (void)setManaPoints:(NSInteger)manaPoints {
    _manaPoints = MAX(manaPoints, 0);
}

@end
