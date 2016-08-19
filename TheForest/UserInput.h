//
//  UserInput.h
//  TheForest
//
//  Created by Princess Sampson on 8/19/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInput : NSObject

NSString* getStringFromUser(int strLength, NSString *prompt);

NSInteger getNumberFromUser(int maxValidChoice, NSString *prompt);

@end
