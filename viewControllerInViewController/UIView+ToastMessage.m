//
//  UIView+ToastMessage.m
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 16..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import "UIView+ToastMessage.h"

@implementation UIView (ToastMessage)

-(void)showWithFrame:(CGRect)aFrame message:(NSString*)aMessage duration:(NSTimeInterval)aDuration
{
    UILabel *toastMessageLabel = [[UILabel alloc]init];
    [self addSubview:toastMessageLabel];
    toastMessageLabel.frame = aFrame;
    toastMessageLabel.layer.cornerRadius = 3.0;
    toastMessageLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    toastMessageLabel.layer.shadowOpacity = 0.8;
    toastMessageLabel.layer.shadowRadius = 6.0;
    toastMessageLabel.layer.shadowOffset = CGSizeMake(4.0, 4.0);
    
    toastMessageLabel.text = aMessage;
    toastMessageLabel.textAlignment = NSTextAlignmentCenter;
    toastMessageLabel.font = [UIFont systemFontOfSize:12.0];
    toastMessageLabel.backgroundColor = [UIColor blackColor];
    toastMessageLabel.textColor = [UIColor whiteColor];
    toastMessageLabel.hidden = NO;
    toastMessageLabel.alpha = 0.0;
    [UIView animateWithDuration:aDuration animations:^{
        toastMessageLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        toastMessageLabel.hidden = NO;
        toastMessageLabel.alpha = 1.0;
        [UIView animateWithDuration:aDuration animations:^{
            toastMessageLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            toastMessageLabel.hidden = YES;
            [toastMessageLabel removeFromSuperview];
        }];
    }];
}


@end
