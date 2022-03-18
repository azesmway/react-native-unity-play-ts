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
    return NO;
}

RCT_EXPORT_METHOD(initUnity:(nonnull NSNumber*) reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        UnityPlayTsView *view = (UnityPlayTsView*) viewRegistry[reactTag];
        if (!view || ![view isKindOfClass:[UnityPlayTsView class]]) {
            RCTLogError(@"Cannot find NativeView with tag #%@", reactTag);
            return;
        }
        [view initUnity];
    }];
}

@end
