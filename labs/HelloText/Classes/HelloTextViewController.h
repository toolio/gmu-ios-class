

#import <UIKit/UIKit.h>

@interface HelloTextViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UILabel *label;
    IBOutlet UITextField *textField;
    
    NSArray *savedText;
}

- (IBAction)sayHello:(id)sender;
- (IBAction)savedText:(id)sender;

@end

