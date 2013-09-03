//
//  welcomeViewController.h
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface welcomeViewController : ViewController <GKPeerPickerControllerDelegate, GKSessionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (nonatomic, strong) GKPeerPickerController *picker;
@property (nonatomic, strong) GKSession *session;
- (IBAction)findOpponent:(id)sender;
@end
