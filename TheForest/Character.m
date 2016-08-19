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
        _healthPoints = 1000;
        _manaPoints = 750;
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:nil];
}

- (NSInteger)attack {
    NSInteger damage = MAX(_manaPoints % arc4random_uniform(150), 30);
    
    return damage;
}

- (void)setHealthPoints:(NSInteger)healthPoints {
    _healthPoints = MAX(healthPoints, 0);

}

- (void)setManaPoints:(NSInteger)manaPoints {
    _manaPoints = MAX(manaPoints, 0);
}

@end
