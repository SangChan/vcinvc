//
//  UIView+ToastMessage.h
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 16..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ToastMessage)
-(void)showWithFrame:(CGRect)aFrame message:(NSString*)aMessage duration:(NSTimeInterval)aDuration;
@end
