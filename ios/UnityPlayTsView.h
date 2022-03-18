#import <Foundation/Foundation.h>
#import <React/RCTView.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface UnityPlayTsView : RCTView <RCTBridgeModule>

- (void)initUnity;

@end
