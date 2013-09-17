//
//  DetailViewController.m
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 13..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController (){
@private UIPickerView *picker;
}

@end

@implementation DetailViewController
@synthesize pickerContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"리스트";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(close:)];
    //self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.navigationItem setHidesBackButton:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [UIView beginAnimations:@"animation2" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration: 0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"this"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"this"];
        cell.textLabel.text = @"test";
    }
    return cell;

}

- (IBAction)buttonClicked:(id)sender
{
    UIButton *pressedButton = (UIButton *)sender;
    /*if (pressedButton.tag == 0) {
        if (picker) {
            return;
        }
        picker = [[UIPickerView alloc]init];
        picker.dataSource = self;
        picker.delegate = self;
        picker.showsSelectionIndicator = YES;
        CGRect pickerFrame = picker.frame;
        pickerFrame.origin.y = self.view.frame.size.height - pickerFrame.size.height;
        picker.frame = pickerFrame;
        [self.view addSubview:picker];

    }
    else {
        for (int i=1; i<3; i++) {
            UIButton *button = (UIButton*)[self.view viewWithTag:i];
            if (pressedButton.tag == button.tag) {
                button.selected = YES;
            }
            else {
                button.selected = NO;
            }
        }
    }*/
    
    [self.view showWithFrame:CGRectMake(25, self.view.frame.size.height-80 , 270, 36) message:@"현재 위치와 50m 이상 오차가 발생할 수 있습니다." duration:1.5];

}

-(void)close:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray *)pickerContent
{
    if(!pickerContent)
        pickerContent = [[NSArray alloc] initWithObjects:@"위치", @"지도",nil];
    return pickerContent;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerContent.count;
}
#pragma mark – Picker Delegate:
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerContent objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.pickerOpenButton.titleLabel.text = [self.pickerContent objectAtIndex:row];
    
}

- (void)viewDidUnload
{
    [self setPickerOpenButton:nil];
    [super viewDidUnload];
}
@end
