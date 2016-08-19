//
//  Character.m
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Character.h"

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
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:nil];
}

- (NSInteger)attack {
    if (-_manaPoints == 0) {
        NSLog(@"You are out of mana");
        return 0;
    }

    NSInteger random = arc4random_uniform(40) + 1;
    NSInteger damage = random;
    [self setManaPoints: _manaPoints - random];
    return damage;
}

- (void)setHealthPoints:(NSInteger)healthPoints {
    _healthPoints = MAX(healthPoints, 0);

}

- (void)setManaPoints:(NSInteger)manaPoints {
    _manaPoints = MAX(manaPoints, 0);
}

@end
