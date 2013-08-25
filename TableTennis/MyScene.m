//
//  MyScene.m
//  TableTennis
//
//  Created by ManuQiao on 13-8-25.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self addEdge];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = CGPointMake(100, 200);
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        [sprite setScale:0.1f];
        SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:sprite.frame.size];
        [sprite setPhysicsBody:body];
        
        
        [self addChild:sprite];
        
        sprite.physicsBody.affectedByGravity = YES;
        self.physicsWorld.gravity = CGPointMake(0, -10);
    }
    return self;
}

- (void)addEdge
{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
