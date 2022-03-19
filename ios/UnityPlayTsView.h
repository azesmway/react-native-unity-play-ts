#import <Foundation/Foundation.h>
#import <React/RCTView.h>

@interface UnityPlayTsView : RCTView

@property (nonatomic, strong) UIView* uView;

+ (void)UnityPostMessage:(NSString*)gameObject methodName:(NSString*)methodName message:(NSString*) message;

@end
