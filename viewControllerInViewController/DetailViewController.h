//
//  DetailViewController.h
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 13..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ToastMessage.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)buttonClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *pickerOpenButton;
@property (nonatomic, strong) NSArray *pickerContent;
@end
 