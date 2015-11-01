//
//  WWButton.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 10/31/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWButton.h"
#import "UIColor+WWColor.h"

@implementation WWButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setup {
    [self setTitleColor:[UIColor WWblue] forState:UIControlStateNormal];
    [[self titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:28]];
}

@end
