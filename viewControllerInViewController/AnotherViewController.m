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
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(5, 5, 141, 251) style:UITableViewStylePlain];
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.userInteractionEnabled = YES;
    myTableView.alpha = 1.0;
    myTableView.scrollEnabled = NO;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.contentInset = UIEdgeInsetsMake(3,0,0,0);
    UIImage *bgForOption = [[UIImage imageNamed:@"box_option_menu.png"]stretchableImageWithLeftCapWidth:40 topCapHeight:14];
    myTableView.backgroundView = [[UIImageView alloc]initWithImage:bgForOption];
    [self.view addSubview:myTableView];
    
    
    //modified by sangchan @2013.7.19 : 테이블뷰 정해진 로우만큼만 그리도록 처리.
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 0)];
    footerView.backgroundColor = [UIColor clearColor];
    myTableView.tableFooterView = footerView;
    myTableView.tableHeaderView = footerView;
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
    return 39;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnotherCell *cell = [theTableView dequeueReusableCellWithIdentifier:@"this"];
    if (cell == nil) {
        cell = [[AnotherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"this"];
        cell.textLabel.text = @"test";
    }
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"select = %d",indexPath.row);
    AnotherCell *cell = [[theTableView visibleCells]objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end
