//
//  bluetoothHelper.h
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
@interface bluetoothHelper : NSObject <GKPeerPickerControllerDelegate, GKSessionDelegate>
@property (nonatomic, strong) GKPeerPickerController *picker;
@property (nonatomic, strong) GKSession *session;
- (void)connect;
- (void)sendData:(id)sender;
@end
