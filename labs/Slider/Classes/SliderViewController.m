

#import "SliderViewController.h"

@implementation SliderViewController

// Say that we support any orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

// Method for slider valueChange action
- (IBAction)changeSlider:(id)sender {
    // We know that the sender is the slider performing the action
    UISlider *slider = sender;

    // Setting the value to an int will cast it from float
    int number = [slider value];
    
    // Use NSString format specifier for signed 32-bit integers
    label.text = [NSString stringWithFormat:@"%i", number];
}


// Clean up memory
- (void)dealloc {
    // Any outlets should be released here, slider isn't an action
    [label release];
    
    [super dealloc];
}

@end
