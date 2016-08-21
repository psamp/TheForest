//
//  Character.h
//  TheForest
//
//  Created by Rodney Sampson on 8/18/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, readwrite) NSInteger healthPoints;
@property (nonatomic, readwrite) NSInteger manaPoints;
@property (nonatomic, copy, readonly) NSMutableArray * spells;
@property (nonatomic, readwrite) NSInteger shieldPoints;

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

- (NSInteger)attack:(NSInteger)spellIndex;

@end
