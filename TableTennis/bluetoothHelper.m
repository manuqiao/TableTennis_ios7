//
//  bluetoothHelper.m
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "bluetoothHelper.h"

@implementation bluetoothHelper

static bluetoothHelper *_instance;

+ (bluetoothHelper *)sharedInstance
{
    if (_instance == nil) {
        _instance = [[bluetoothHelper alloc] init];
    }
    return _instance;
}

- (void)connect
{
    _picker = [[GKPeerPickerController alloc] init];
    _picker.delegate = self;
    _picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [_picker show];
}

- (void)sendData:(id)sender
{
    NSString *sendStr;
    
    NSData* data = [sendStr dataUsingEncoding: NSUTF8StringEncoding];
    
    if (_session) {
        
        [_session sendDataToAllPeers:data
                        withDataMode:GKSendDataReliable  error:nil];
        
    }
    
}

#pragma - GKPeerPickerControllerDelegate

- (void)peerPickerController:(GKPeerPickerController *)pk didConnectPeer:(NSString *)peerID toSession:(GKSession *) session
{
    _session = session;
    
    _session.delegate = self;
    
    [_session setDataReceiveHandler:self withContext:nil];
    
    _picker.delegate = nil;
    
    [_picker dismiss];
}

#pragma - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID

 didChangeState:(GKPeerConnectionState)state

{
    
    if (state == GKPeerStateConnected)
        
    {
        
        
        
    } else if (state == GKPeerStateDisconnected)
        
    {
        
        
        
    }
    
}

- (void) receiveData:(NSData *)data  fromPeer:(NSString *)peer

           inSession:(GKSession *)session  context:(void *)context

{
    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data
                  
                                                 options:NSJSONReadingMutableContainers error:nil];
    
    
}

@end
