//
//  WWTextField.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 11/2/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWTextField.h"
#import "UIColor+WWColor.h"
#import "UIFont+WWFont.h"

@interface WWTextField()
@property (strong,nonatomic)UILabel *placeholderLabel;
@end

@implementation WWTextField


-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setup {
    [self setFont: [UIFont WWmediumFontSize]];
    [self setTextColor: [UIColor whiteColor]];
    self.delegate = self;
    
    [self setupBorder];
    [self setupPlaceholder];
}

-(void) setupBorder {
    [self setBorderStyle:UITextBorderStyleNone];
    
    CALayer *bottomBorder = [CALayer layer];
    
    CGFloat y = self.frame.size.height - 0.5f;
    CGFloat w = self.frame.size.width;
    
    bottomBorder.frame = CGRectMake(0.0f,y,w,0.5f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    
    [self.layer addSublayer:bottomBorder];
    
}

-(void)setupPlaceholder {
    self.placeholderLabel = [[UILabel alloc] init];
    [self.placeholderLabel setText:self.placeholder];
    [self.placeholderLabel setTextColor:[UIColor whiteColor]];
    
    [self addSubview:self.placeholderLabel];
    self.placeholder = @"";
    
    [self setupPlaceholderState];
}

-(void) setupPlaceholderStateNormal {
    [self.placeholderLabel setFrame:CGRectMake(0, 5, self.frame.size.width, self.frame.size.height)];
    [self.placeholderLabel setFont:[UIFont WWmediumFontSize]];
}

-(void) setupPlaceholderStateFocused {
    [self.placeholderLabel setFrame:CGRectMake(0, 0, self.frame.size.width, 10.0f)];
    [self.placeholderLabel setFont:[UIFont WWmicroFont]];
}

-(void) setupPlaceholderState {
    if(![self.text isEqualToString:@""] || self.isFirstResponder) {
        [self setupPlaceholderStateFocused];
    } else {
        [self setupPlaceholderStateNormal];
    }
}

-(void) animatePlaceHolder {
    [UIView animateWithDuration:0.2f animations:^{
        [self setupPlaceholderState];
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animatePlaceHolder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animatePlaceHolder];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    
    [self animatePlaceHolder];
}
@end
