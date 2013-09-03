//
//  welcomeViewController.m
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "welcomeViewController.h"

@interface welcomeViewController ()

@end

@implementation welcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findOpponent:(id)sender {
    _picker = [[GKPeerPickerController alloc] init];
    _picker.delegate = self;
    _picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [_picker show];
}

- (void)peerPickerController:(GKPeerPickerController *)pk didConnectPeer:(NSString *)peerID toSession:(GKSession *) session
{
    _session = session;
    
    _session.delegate = self;
    
    [_session setDataReceiveHandler:self withContext:nil];
    
    _picker.delegate = nil;
    
    [_picker dismiss];
}

@end
