//  ViewController.m
//  MSSToggleSwitch
//  Created by Michael McEvoy on 3/22/15.
//  Copyright (c) 2015 Mustard Seed Software LLC. All rights reserved.
// Header import
#import "ViewController.h"
// Other imports
#import "MSSToggleSwitch.h"

@interface ViewController () {
    
}

#pragma mark -
#pragma mark - UI "Constants"

#pragma mark -
#pragma mark - UI Controls
@property (strong, nonatomic) MSSToggleSwitch *toggle;

#pragma mark -
#pragma mark - Private Properties


@end

@implementation ViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUserInterface];
}

#pragma mark - UI Setup
- (void)setupUserInterface {
    [self createConstants];
    [self createControls];
    [self setupControls];
    [self layoutControls];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)createConstants {
    
}
- (void)createControls {
    self.toggle = [[MSSToggleSwitch alloc] init];
}
- (void)setupControls {
    self.toggle.borderColor             = [UIColor lightGrayColor];
    self.toggle.borderWidth             = 1.0f;
    self.toggle.leftBackgroundColor     = [UIColor colorWithRed:0.0f green:0.8f blue:0.0f alpha:1.0f];
    self.toggle.leftLabelFont           = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0f];
    self.toggle.leftText                = @"On";
    self.toggle.leftTextColor           = [UIColor whiteColor];
    self.toggle.rightBackgroundColor    = [UIColor colorWithRed:0.8f green:0.0f blue:0.0f alpha:1.0f];
    self.toggle.rightLabelFont          = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0f];
    self.toggle.rightText               = @"Off";
    self.toggle.rightTextColor          = [UIColor whiteColor];
    self.toggle.thumbBorderColor        = [UIColor darkGrayColor];
    self.toggle.thumbBorderWidth        = 1.0f;
    self.toggle.thumbColor              = [UIColor darkGrayColor];
    [self.toggle setTranslatesAutoresizingMaskIntoConstraints:NO];
}
- (void)layoutControls {
    [self.view addSubview:self.toggle];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[toggle(==height)]"
                                                                      options:0
                                                                      metrics:@{@"margin":  @(40),
                                                                                @"height":  @(40)}
                                                                        views:@{@"toggle":  self.toggle}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toggle
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0f
                                                           constant:80.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.toggle
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.0f]];
}
@end