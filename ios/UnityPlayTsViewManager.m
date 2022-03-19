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

    return unity;
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
