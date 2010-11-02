
#import <UIKit/UIKit.h>

@class HelloTextViewController;

@interface HelloTextAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloTextViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloTextViewController *viewController;

@end

