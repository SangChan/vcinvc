//
//  AnotherViewController.m
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 11..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController () {
@private UITapGestureRecognizer *tapGesture;
}

@end

@implementation AnotherViewController

@synthesize myTableView, myView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    myView.backgroundColor = [UIColor blackColor];
    myView.alpha = 0.5;
    [self.view addSubview:myView];
    
    tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tabbed)];
    [myView addGestureRecognizer:tapGesture];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(5, 5, 190, 390) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.userInteractionEnabled = YES;
    myTableView.alpha = 1.0;
    [self.view addSubview:myTableView];
}

-(void)tabbed
{
    myView.alpha = 1.0;
    myView.hidden = YES;
    myTableView.hidden = YES;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"REMOVE_ANOTHER" object:nil];
    //[myTableView removeFromSuperview];
    //[myView removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidUnload {
    [myView removeGestureRecognizer:tapGesture];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"this"];
    //cell.textLabel.text = @"test";
    //return cell;
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:@"this"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"this"];
        cell.textLabel.text = @"test";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select = %d",indexPath.row);
}

@end
