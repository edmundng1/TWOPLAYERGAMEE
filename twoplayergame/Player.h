//
//  Player.h
//  twoplayergame
//
//  Created by Edmund Ng on 2016-05-09.
//  Copyright © 2016 paperchasers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) int lives;

-(instancetype) initWithName:(NSString *)name andwithLives: (int)lives;
-(void) loselives:(int)lives;

@end
