//
//  Player.m
//  twoplayergame
//
//  Created by Edmund Ng on 2016-05-09.
//  Copyright © 2016 paperchasers. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name andwithLives:(int)lives
{
    self = [super init];
    if (self) {
        _name = name;
        _lives = lives;
        
        
    }
    
    
    return self;
}

-(void) loselives:(int)lives {
    self.lives -= lives;
}

@end
