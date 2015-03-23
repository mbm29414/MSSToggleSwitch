//  MSSToggleSwitch.h
//  Created by Michael McEvoy on 11/25/14.
//  Copyright (c) 2014 Mustard Seed Software LLC. All rights reserved.
#import <UIKit/UIKit.h>
@interface MSSToggleSwitch : UIControl {
    
}

#pragma mark - Public Properties
@property (copy  , nonatomic) void(^animationBlock)(void);
@property (assign, nonatomic, readonly) BOOL         on;
@property (assign, nonatomic)           CGFloat      borderWidth;
@property (assign, nonatomic)           CGFloat      thumbBorderWidth;
@property (copy  , nonatomic)           NSString    *leftText;
@property (copy  , nonatomic)           NSString    *rightText;
@property (strong, nonatomic)           UIColor     *borderColor;
@property (strong, nonatomic)           UIColor     *leftBackgroundColor;
@property (strong, nonatomic)           UIColor     *rightBackgroundColor;
@property (strong, nonatomic)           UIColor     *leftTextColor;
@property (strong, nonatomic)           UIColor     *rightTextColor;
@property (strong, nonatomic)           UIColor     *thumbBorderColor;
@property (strong, nonatomic)           UIColor     *thumbColor;
@property (strong, nonatomic)           UIFont      *leftLabelFont;
@property (strong, nonatomic)           UIFont      *rightLabelFont;

#pragma mark - Public Instance Methods
- (NSString *)visibleTitle;
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated;
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated animationBlock:(void(^)(void))animationBlock;
- (void)setIsOn:(BOOL)isOn animated:(BOOL)animated animationBlock:(void(^)(void))animationBlock forwardEvent:(BOOL)forwardEvent;

@end