

#import <UIKit/UIKit.h>

@interface HelloTextViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UILabel *label;
    IBOutlet UITextField *textField;
}

- (IBAction)sayHello:(id)sender;

@end

