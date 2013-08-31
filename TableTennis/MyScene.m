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
        [self addBlock];
        
        self.physicsWorld.gravity = CGPointMake(0, -10);
    }
    return self;
}

- (void)addBlock
{
//    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(50, 25)];
    sprite.position = CGPointMake(100, 200);
    
//    [sprite setScale:0.1f];
    SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:sprite.frame.size];
    [sprite setPhysicsBody:body];
    sprite.physicsBody.affectedByGravity = NO;
    [sprite setName:@"myBlock"];
    
    [self addChild:sprite];
}

- (void)addEdge
{
    CGSize winSize = self.scene.size;
    
    SKSpriteNode *edgeLeft = [self createEdgeWithSize:CGSizeMake(1, winSize.height)];
    [edgeLeft setPosition:CGPointMake(0, winSize.height / 2)];
    
    SKSpriteNode *edgeRight = [self createEdgeWithSize:CGSizeMake(1, winSize.height)];
    [edgeRight setPosition:CGPointMake(winSize.width, winSize.height / 2)];
    
//    SKSpriteNode *edgeBottom = [self createEdgeWithSize:CGSizeMake(winSize.width, 1)];
//    [edgeBottom setPosition:CGPointMake(winSize.width / 2, 0)];
    
    [self addChild:edgeLeft];
    [self addChild:edgeRight];
//    [self addChild:edgeBottom];
}

- (SKSpriteNode *)createEdgeWithSize:(CGSize)size
{
    SKSpriteNode *edge = [[SKSpriteNode alloc] initWithColor:[UIColor greenColor] size:size];
    edge.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:edge.frame.size];
    edge.physicsBody.dynamic = NO;
    return edge;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        _touchStartPosition = location;
        
        SKSpriteNode *sprite = (SKSpriteNode *)[self childNodeWithName:@"myBlock"];
        _blockStartPosition = sprite.position;
        
        NSLog(@"%.2f, %.2f", location.x, location.y);
//        [self addBlock];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = (SKSpriteNode *)[self childNodeWithName:@"myBlock"];
        
        CGPoint delta = CGPointMake(location.x - _touchStartPosition.x, location.y - _touchStartPosition.y);
        CGPoint position = CGPointMake(_blockStartPosition.x + delta.x, _blockStartPosition.y + delta.y);
        
        [sprite setPosition:position];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
