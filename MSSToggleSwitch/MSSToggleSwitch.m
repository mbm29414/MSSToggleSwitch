// Defines
#define DEFAULT_BORDER_COLOR            [UIColor darkGrayColor]

#define DEFAULT_LEFT_BACKGROUND_COLOR   [UIColor redColor]
#define DEFAULT_LEFT_FONT               [UIFont boldSystemFontOfSize:[UIFont labelFontSize]]
#define DEFAULT_LEFT_TEXT               @"OFF"
#define DEFAULT_LEFT_TEXT_COLOR         [UIColor whiteColor]

#define DEFAULT_RIGHT_BACKGROUND_COLOR  [UIColor greenColor]
#define DEFAULT_RIGHT_FONT              [UIFont boldSystemFontOfSize:[UIFont labelFontSize]]
#define DEFAULT_RIGHT_TEXT              @"ON"
#define DEFAULT_RIGHT_TEXT_COLOR        [UIColor whiteColor]

#define DEFAULT_THUMB_COLOR             [UIColor lightGrayColor]
#define DEFAULT_THUMB_BORDER_COLOR      [UIColor lightGrayColor]

//  MSSToggleSwitch.m
//  Created by Michael McEvoy on 11/25/14.
//  Copyright (c) 2014 Mustard Seed Software LLC. All rights reserved.
// Header import
#import "MSSToggleSwitch.h"

@interface MSSToggleSwitch () {
    
}

#pragma mark - Private Properties
@property (assign, nonatomic, readwrite) BOOL isOn;

#pragma mark - UI Controls
@property (strong, nonatomic) NSLayoutConstraint    *thumbBottom;
@property (strong, nonatomic) NSLayoutConstraint    *thumbRight;
@property (strong, nonatomic) NSLayoutConstraint    *thumbTop;
@property (strong, nonatomic) UILabel               *leftLabel;
@property (strong, nonatomic) UILabel               *rightLabel;
@property (strong, nonatomic) UIView                *leftView;
@property (strong, nonatomic) UIView                *rightView;
@property (strong, nonatomic) UIView                *thumbView;

@end

@implementation MSSToggleSwitch

#pragma mark - Default Values
- (NSString *)getLeftText {
    if (self.leftText != nil) {
        return self.leftText;
    } else {
        return DEFAULT_LEFT_TEXT;
    }
}
- (NSString *)getRightText {
    if (self.leftText != nil) {
        return self.rightText;
    } else {
        return DEFAULT_RIGHT_TEXT;
    }
}
- (UIColor *)getBorderColor {
    if (self.borderColor != nil) {
        return self.borderColor;
    } else {
        return DEFAULT_BORDER_COLOR;
    }
}
- (UIColor *)getLeftBackgroundColor {
    if (self.leftBackgroundColor != nil) {
        return self.leftBackgroundColor;
    } else {
        return DEFAULT_LEFT_BACKGROUND_COLOR;
    }
}
- (UIColor *)getLeftTextColor {
    if (self.leftTextColor != nil) {
        return self.leftTextColor;
    } else {
        return DEFAULT_LEFT_TEXT_COLOR;
    }
}
- (UIColor *)getRightBackgroundColor {
    if (self.rightBackgroundColor != nil) {
        return self.rightBackgroundColor;
    } else {
        return DEFAULT_RIGHT_BACKGROUND_COLOR;
    }
}
- (UIColor *)getRightTextColor {
    if (self.rightTextColor != nil) {
        return self.rightTextColor;
    } else {
        return DEFAULT_RIGHT_TEXT_COLOR;
    }
}
- (UIColor *)getThumbColor {
    if (self.thumbColor != nil) {
        return self.thumbColor;
    } else {
        return DEFAULT_THUMB_COLOR;
    }
}
- (UIFont *)getLeftLabelFont {
    if (self.leftLabelFont != nil) {
        return self.leftLabelFont;
    } else {
        return DEFAULT_LEFT_FONT;
    }
}
- (UIFont *)getRightLabelFont {
    if (self.rightLabelFont != nil) {
        return self.rightLabelFont;
    } else {
        return DEFAULT_RIGHT_FONT;
    }
}

#pragma mark - Accessors
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor                        = borderColor;
    self.layer.borderColor              = borderColor.CGColor;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth                        = borderWidth;
    self.layer.borderWidth              = borderWidth;
    self.thumbBottom.constant           = borderWidth;
    self.thumbRight.constant            = borderWidth;
    self.thumbTop.constant              = borderWidth;
    [self layoutIfNeeded];
}
- (void)setLeftBackgroundColor:(UIColor *)leftBackgroundColor {
    _leftBackgroundColor                = leftBackgroundColor;
    self.leftView.backgroundColor       = leftBackgroundColor;
}
- (void)setLeftLabelFont:(UIFont *)leftLabelFont {
    _leftLabelFont                      = leftLabelFont;
    self.leftLabel.font                 = leftLabelFont;
}
- (void)setLeftText:(NSString *)leftText {
    _leftText                           = leftText;
    self.leftLabel.text                 = leftText;
}
- (void)setLeftTextColor:(UIColor *)leftTextColor {
    _leftTextColor                      = leftTextColor;
    self.leftLabel.textColor            = leftTextColor;
}
- (void)setRightBackgroundColor:(UIColor *)rightBackgroundColor {
    _rightBackgroundColor               = rightBackgroundColor;
    self.rightView.backgroundColor      = rightBackgroundColor;
}
- (void)setRightLabelFont:(UIFont *)rightLabelFont {
    _rightLabelFont                     = rightLabelFont;
    self.rightLabel.font                = rightLabelFont;
}
- (void)setRightText:(NSString *)rightText {
    _rightText                          = rightText;
    self.rightLabel.text                = rightText;
}
- (void)setRightTextColor:(UIColor *)rightTextColor {
    _rightTextColor                     = rightTextColor;
    self.rightLabel.textColor           = rightTextColor;
}
- (void)setThumbBorderColor:(UIColor *)thumbBorderColor {
    _thumbBorderColor                   = thumbBorderColor;
    self.thumbView.layer.borderColor    = thumbBorderColor.CGColor;
}
- (void)setThumbBorderWidth:(CGFloat)thumbBorderWidth {
    _thumbBorderWidth                   = thumbBorderWidth;
    self.thumbView.layer.borderWidth    = thumbBorderWidth;
}
- (void)setThumbColor:(UIColor *)thumbColor {
    _thumbColor                         = thumbColor;
    self.thumbView.backgroundColor      = thumbColor;
}

#pragma mark - Initializer
- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _isOn                   = NO;
        self.thumbBorderWidth   = 1.0f;
        [self setupSubviews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _isOn   = NO;
        [self setupSubviews];
    }
    return self;
}

#pragma mark - Touch Handling
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self MSSToggleSwitch];
}
- (void)MSSToggleSwitch {
    [self setIsOn:!self.isOn animated:YES];
}
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated {
    [self setIsOn:isOn animated:animated animationBlock:nil];
}
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated animationBlock:(void(^)(void))animationBlock {
    [self setIsOn:isOn animated:animated animationBlock:animationBlock forwardEvent:YES];
}
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated animationBlock:(void(^)(void))animationBlock forwardEvent:(BOOL)forwardEvent {
    self.isOn                       = isOn;
    if (self.isOn == NO) {
        self.thumbRight.constant    = self.borderWidth;
    } else {
        self.thumbRight.constant    = self.frame.size.width - (self.thumbView.frame.size.width + self.borderWidth);
    }
    [UIView animateWithDuration:(animated)?0.4f:0.0f
                     animations:^{
                         if (self.animationBlock != nil) {
                             self.animationBlock();
                         }
                         if (animationBlock != nil) {
                             animationBlock();
                         }
                         [self layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         if (forwardEvent == YES) {
                             [self sendActionsForControlEvents:UIControlEventValueChanged];
                         }
                     }
     ];
}

#pragma mark - Methodized Properties
- (NSString *)visibleTitle {
    if (self.isOn == YES) {
        return self.rightLabel.text;
    } else {
        return self.leftLabel.text;
    }
}

#pragma mark - View Layout
- (void)setupUserInterface {
    [self createConstants];
    [self createControls];
    [self setupControls];
    [self layoutControls];
}
- (void)createConstants {
    
}
- (void)createControls {
    
}
- (void)setupControls {
    
}
- (void)layoutControls {
    
}
- (void)setupSubviews {
    CGFloat borderWidth             = self.borderWidth;
    self.layer.borderColor          = [self getBorderColor].CGColor;
    self.layer.borderWidth          = borderWidth;
    self.layer.masksToBounds        = YES;
    
    UIView *thumbView               = [[UIView alloc] init];
    thumbView.backgroundColor       = [self getThumbColor];
    [thumbView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.thumbView                  = thumbView;
    [self addSubview:self.thumbView];
    
    self.thumbBottom            = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.thumbView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0f
                                                                constant:borderWidth];
    self.thumbRight             = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.thumbView
                                                               attribute:NSLayoutAttributeTrailing
                                                              multiplier:1.0f
                                                                constant:borderWidth];
    self.thumbTop               = [NSLayoutConstraint constraintWithItem:self.thumbView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0f
                                                                constant:borderWidth];
    [self addConstraints:@[self.thumbBottom, self.thumbRight, self.thumbTop]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.thumbView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.thumbView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    thumbView.layer.cornerRadius    = thumbView.frame.size.height / 2.0f;
    
    UIView *leftView            = [[UIView alloc] init];
    leftView.backgroundColor    = [self getLeftBackgroundColor];
    leftView.clipsToBounds      = YES;
    [leftView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.leftView               = leftView;
    [self addSubview:self.leftView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftView
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.thumbView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0f
                                                      constant:-1.0f * self.thumbView.frame.size.width / 2.0f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"leftView": self.leftView}]];
    
    UILabel *leftLabel          = [[UILabel alloc] init];
    leftLabel.text              = [self getLeftText];
    leftLabel.textAlignment     = NSTextAlignmentCenter;
    leftLabel.textColor         = [self getLeftTextColor];
    [leftLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.leftLabel              = leftLabel;
    [self.leftView addSubview:self.leftLabel];
    [self.leftView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftLabel
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.leftView
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.0f
                                                               constant:0.0f]];
    [self.leftView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftLabel
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.leftView
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1.0f
                                                               constant:0.0f]];
    
    UIView *rightView           = [[UIView alloc] init];
    rightView.backgroundColor   = [self getRightBackgroundColor];
    rightView.clipsToBounds     = YES;
    [rightView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.rightView              = rightView;
    [self addSubview:self.rightView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.thumbView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0f
                                                      constant:-1.0f * self.thumbView.frame.size.width / 2.0f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"rightView": self.rightView}]];
    
    UILabel *rightLabel         = [[UILabel alloc] init];
    rightLabel.text             = [self getRightText];
    rightLabel.textAlignment    = NSTextAlignmentCenter;
    rightLabel.textColor        = [self getRightTextColor];
    [rightLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.rightLabel             = rightLabel;
    [self.rightView addSubview:self.rightLabel];
    [self.rightView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightLabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.rightView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0f
                                                                constant:0.0f]];
    [self.rightView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightLabel
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.rightView
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0f
                                                                constant:0.0f]];
    
    [self bringSubviewToFront:self.thumbView];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.thumbBottom.constant           = self.borderWidth;
    self.thumbTop.constant              = self.borderWidth;
    if (self.isOn == NO) {
        self.thumbRight.constant        = self.borderWidth;
        
    } else {
        self.thumbRight.constant        = self.frame.size.width - (self.thumbView.frame.size.width + self.borderWidth);
    }
    self.layer.cornerRadius             = self.frame.size.height / 2.0f;
    self.thumbView.layer.cornerRadius   = self.thumbView.frame.size.height / 2.0f;
    [self.thumbView setNeedsDisplay];
    [self layoutIfNeeded];
}
@end