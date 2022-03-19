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

  return self;
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
    [[self ufw] setDataBundleId: "com.unity3d.framework"];
    [[self ufw] registerFrameworkListener: self];
    [[self ufw] runEmbeddedWithArgc: gArgc argv:[self getArray] appLaunchOpts: appLaunchOpts];
}

- (void)unloadUnity
{
    UIWindow * main = [[[UIApplication sharedApplication] delegate] window];
    if(main != nil) {
        [main makeKeyAndVisible];
        [[self ufw] unloadApplication];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
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
