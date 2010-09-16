
#import <UIKit/UIKit.h>

@class SliderViewController;

@interface SliderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SliderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SliderViewController *viewController;

@end

