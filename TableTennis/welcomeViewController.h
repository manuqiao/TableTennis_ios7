//
//  welcomeViewController.h
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "ViewController.h"

@class bluetoothHelper;
@class ViewController;
@interface welcomeViewController : ViewController
{
    bluetoothHelper *_helper;
    ViewController *_gameViewController;
}

@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)findOpponent:(id)sender;
@end
