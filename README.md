# MSSToggleSwitch
A replacement for Apple's UISwitch with greater flexibility and customization.

<b>Usage:</b>

Simply add MSSToggleSwitch.h/.m to your project and you'll be good to go!


Here's a basic "On"/"Off" switch:

    self.toggle                         = [[MSSToggleSwitch alloc] init];
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
    // For a pure autolayout setup...
    [self.toggle setTranslatesAutoresizingMaskIntoConstraints:NO];

Here's how you'd execute condition code to run concurrent with the "swap" animation:

    self.toggle.animationBlock = ^{
        // Whatever code you put in here will execute alongside the 
        // thumb switch animation
    };

Have a look at ViewController.h/.m in the demo project to see a basic implementation.