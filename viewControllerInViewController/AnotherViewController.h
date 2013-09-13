//
//  AnotherViewController.h
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 11..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnotherCell.h"

@interface AnotherViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> 
@property (strong, nonatomic) UIView *myView;
@property (strong, nonatomic) UITableView *myTableView;
@end
