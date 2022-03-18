#import "UnityPlayTsView.h"
#include <UnityFramework/UnityFramework.h>

int gArgc = 1;
char** gArgv = NULL;
NSDictionary* appLaunchOpts;

@interface UnityPlayTsView ()<UnityFrameworkListener>
@property UnityFramework* ufw;
@end

@implementation UnityPlayTsView

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
      // [self initUnity];
  }

  return self;
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

UnityFramework* UnityFrameworkLoad()
{
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];

    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];

    UnityFramework* ufw = [bundle.principalClass getInstance];
    if (![ufw appController])
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }
    return ufw;
}

- (void)initUnity
{
    [self setUfw: UnityFrameworkLoad()];
    // [self setUfw: UnityFrameworkLoad()];
    // Set UnityFramework target for Unity-iPhone/Data folder to make Data part of a UnityFramework.framework and uncomment call to setDataBundleId
    // ODR is not supported in this case, ( if you need embedded and ODR you need to copy data )
    [[self ufw] setDataBundleId: "com.unity3d.framework"];
    [[self ufw] registerFrameworkListener: self];
    // [NSClassFromString(@"FrameworkLibAPI") registerAPIforNativeCalls:self];

    [[self ufw] runEmbeddedWithArgc: gArgc argv:[self getArray] appLaunchOpts: appLaunchOpts];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
