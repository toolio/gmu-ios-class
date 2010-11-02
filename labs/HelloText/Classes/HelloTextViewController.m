
#import "HelloTextViewController.h"

@implementation HelloTextViewController

// Change some of the interface before showing to screen
- (void)viewDidLoad {
    savedText = [[NSArray alloc] init];
    
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

    // broken because savedText will be autoreleased sometime later, then crash later when accessed
    //savedText = [savedText arrayByAddingObject:textField.text];
    
    // fixed
    savedText = [[savedText arrayByAddingObject:textField.text] retain];
    
    label.text = [NSString stringWithFormat:@"Hello %@", textField.text];
    textField.text = nil;
    [textField resignFirstResponder];
}

- (IBAction)savedText:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved text" message:[savedText componentsJoinedByString:@","] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
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
    [savedText release];
    [super dealloc];
}

@end
