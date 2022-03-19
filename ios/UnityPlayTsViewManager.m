#import <React/RCTViewManager.h>
#import <UnityPlayTsView.h>

#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>

@interface UnityPlayTsViewManager : RCTViewManager
@end

@implementation UnityPlayTsViewManager

RCT_EXPORT_MODULE(UnityPlayTsView)

- (UIView *)view
{
    UnityPlayTsView *unity = [UnityPlayTsView new];
    UIWindow * main = [[[UIApplication sharedApplication] delegate] window];

    if(main != nil) {
        [main makeKeyAndVisible];
    }

    return unity;
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
