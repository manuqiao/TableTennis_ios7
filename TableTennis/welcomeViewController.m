//
//  welcomeViewController.m
//  TableTennis
//
//  Created by ManuQiao on 13-9-3.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "welcomeViewController.h"
#import "bluetoothHelper.h"
#import "ViewController.h"
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
    _helper = [bluetoothHelper sharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findOpponent:(id)sender
{
    [_helper connect];
    while (!_helper.session) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    _gameViewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:_gameViewController animated:NO completion:nil];
}


@end
