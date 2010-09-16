
#import "HelloTextViewController.h"

@implementation HelloTextViewController

// Change some of the interface before showing to screen
- (void)viewDidLoad {
    // Clear label text
    label.text = nil;
    
    // Set ourselves as the textfield delegate
    textField.delegate = self;
    
    [super viewDidLoad];
}

// Support any orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

// Method for button action
- (IBAction)sayHello:(id)sender {
    label.text = [NSString stringWithFormat:@"Hello %@", textField.text];
    textField.text = nil;
    [textField resignFirstResponder];
}

// Delegate method for UITextField when return is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [self sayHello:tf];
    return YES;
}

// Release outlets
- (void)dealloc {
    [label release];
    [textField release];
    [super dealloc];
}

@end
