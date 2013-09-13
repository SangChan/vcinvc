//
//  ViewController.h
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 11..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AnotherViewController.h"
#import "DetailViewController.h"
#import "MyPlaceViewController.h"

@interface ViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *button;
- (IBAction)buttonClicked:(id)sender;
@end
