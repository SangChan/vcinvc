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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeAnotheView) name:@"REMOVE_ANOTHER" object:nil];
    self.title = @"지도";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(flipNewBar)];
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
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0)
    {
        another = [[AnotherViewController alloc]init];
        [self.view.window addSubview:another.view];
    }
    else {
        MyPlaceViewController *myPlace = [[MyPlaceViewController alloc]initWithNibName:@"MyPlaceViewController" bundle:nil];
        UINavigationController *navCon = [[UINavigationController alloc]initWithRootViewController:myPlace];
        [self presentModalViewController:navCon animated:YES];
        //[self.navigationController pushViewController:myPlace animated:YES];
    }
}

-(void)removeAnotheView{
    [another.view removeFromSuperview];
}

-(void)flipNewBar
{
    DetailViewController *detail = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    //[self.navigationController pushViewController:detail animated:NO];
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.7];
    [self.navigationController pushViewController:detail animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}
@end
