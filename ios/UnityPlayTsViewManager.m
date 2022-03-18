#import <React/RCTViewManager.h>
#import <UnityPlayTsView.h>

@interface UnityPlayTsViewManager : RCTViewManager
@end

@implementation UnityPlayTsViewManager

RCT_EXPORT_MODULE(UnityPlayTsView)

- (UIView *)view
{
  return [[UnityPlayTsView alloc] initWithFrame:self.bounds];
}

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

@end
