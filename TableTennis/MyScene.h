//
//  MyScene.h
//  TableTennis
//

//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene
{
    CGPoint _touchStartPosition;
    CGPoint _blockStartPosition;
}

- (void)sendData:(NSString *)json;
- (void)receiveData:(NSString *)json;
@end
