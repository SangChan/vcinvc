//
//  ViewController.m
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 11..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
@private AnotherViewController *another;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setButton:nil];
    [super viewDidUnload];
}
- (IBAction)buttonClicked:(id)sender {
    another = [[AnotherViewController alloc]init];
    //[self addChildViewController:another];
    [self.view.window addSubview:another.view];
}
@end
