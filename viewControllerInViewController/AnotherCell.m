//
//  AnotherCell.m
//  viewControllerInViewController
//
//  Created by 이 상찬 on 13. 9. 12..
//  Copyright (c) 2013년 이 상찬. All rights reserved.
//

#import "AnotherCell.h"

@implementation AnotherCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    //[super setSelected:selected animated:animated];
    self.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = (selected) ? [UIColor redColor] : [UIColor blackColor];
    
    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    //[super setHighlighted:highlighted animated:animated];
    self.backgroundColor = (highlighted) ? [UIColor blackColor] : [UIColor clearColor];
    self.textLabel.textColor = (highlighted) ? [UIColor whiteColor] : [UIColor blackColor];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 3.5;
    frame.size.width -= 2 * 3.5;
    [super setFrame:frame];
}

@end
