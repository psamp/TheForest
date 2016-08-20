//
//  Spell.h
//  TheForest
//
//  Created by Rodney Sampson on 8/20/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Spell : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSString * effect;
@property (nonatomic, readonly) NSInteger manaCost;

- (instancetype)initWithName:(NSString *)name effect:(NSString *)effect manaCost:(NSInteger)manaCost  NS_DESIGNATED_INITIALIZER;

@end
