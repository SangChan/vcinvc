//
//  MyPlaceViewController.h
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 13..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myPlaceTable;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)buttonClicked:(id)sender;

@end
