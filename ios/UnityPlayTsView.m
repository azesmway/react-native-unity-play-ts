#import "UnityPlayTsView.h"
#include <UnityFramework/UnityFramework.h>

int gArgc = 1;
char** gArgv = NULL;
NSDictionary* appLaunchOpts;

@interface UnityPlayTsView ()<UnityFrameworkListener>
@property UnityFramework* unityFramework;
@end

@implementation UnityPlayTsView

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];

  return self;
}

- (bool)unityIsInitialized
{
    return [self unityFramework] && [[self unityFramework] appController];
}

- (void)initUnity:(CGRect)bounds
{
    if([self unityIsInitialized])
    {
        NSLog(@"Unity already initialized, Unload Unity first");
        return;
    }

    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];

    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];

    UnityFramework* ufw = [bundle.principalClass getInstance];
    [self setUnityFramework: ufw];
    if (![ufw appController])
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }

    [ufw setDataBundleId: [bundle.bundleIdentifier cStringUsingEncoding:NSUTF8StringEncoding]];
    [ufw registerFrameworkListener: self];
    [ufw runEmbeddedWithArgc: gArgc argv:[self getArray] appLaunchOpts: appLaunchOpts];
    [[ufw appController] window].frame = bounds;
    [self addSubview:[[ufw appController] window]];
}

- (void)dealloc
{
    [[self unityFramework] unloadApplication];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self initUnity:self.bounds];
}

- (char**)getArray
{
    unsigned count = [[[NSProcessInfo processInfo] arguments] count];
    char **array = (char **)malloc((count + 1) * sizeof(char*));

    for (unsigned i = 0; i < count; i++)
    {
         array[i] = strdup([[[[NSProcessInfo processInfo] arguments] objectAtIndex:i] UTF8String]);
    }
    array[count] = NULL;
    return array;
}

@end
