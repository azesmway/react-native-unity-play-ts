#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#include <UnityFramework/UnityFramework.h>

@interface UnityPlayTsView : RCTView <RCTEventEmitter, RCTBridgeModule, UnityFrameworkListener>

@property UnityFramework* ufw;

@end
