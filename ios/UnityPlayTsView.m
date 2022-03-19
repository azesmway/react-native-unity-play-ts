#import "UnityPlayTsView.h"
#import "UnityPlayTs.h"

NSDictionary* appLaunchOpts;

@implementation UnityPlayTsView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _uView = [[[UnityPlayTs launchWithOptions:appLaunchOpts] appController] rootView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [_uView removeFromSuperview];
    _uView.frame = self.bounds;
    [self insertSubview:_uView atIndex:0];
}

- (void)dealloc
{
    UIWindow * main = [[[UIApplication sharedApplication] delegate] window];
    if(main != nil) {
        [main makeKeyAndVisible];
        [[UnityPlayTs ufw] unloadApplication];
    }
}

@end
