//
//  Spell.m
//  TheForest
//
//  Created by Rodney Sampson on 8/20/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Spell.h"

@implementation Spell

- (instancetype)initWithName:(NSString *)name effect:(NSString *)effect manaCost:(NSInteger)manaCost {
    self = [super init];
    if (self) {
        _name = name;
        _effect = effect;
        _manaCost = manaCost;
    }
    return self;
}

- (instancetype)init {
    return [self initWithName:(NSString *)@"Error" effect:(NSString *)@"Error" manaCost:(NSInteger)0];
}

@end
