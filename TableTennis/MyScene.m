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
        [self addSpaceShip];
        
        self.physicsWorld.gravity = CGPointMake(0, -10);
    }
    return self;
}

- (void)addSpaceShip
{
//    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(50, 25)];
    sprite.position = CGPointMake(100, 200);
    
//    [sprite setScale:0.1f];
    SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:sprite.frame.size];
    [sprite setPhysicsBody:body];
    sprite.physicsBody.affectedByGravity = YES;
    
    [self addChild:sprite];
}

- (void)addEdge
{
    CGSize winSize = self.scene.size;
    SKPhysicsBody *edge = [SKPhysicsBody bodyWithEdgeFromPoint:(CGPoint){0, 0} toPoint:(CGPoint){winSize.width, 0}];
    self.physicsBody = edge;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        [self addSpaceShip];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
