#import "VerticalCardPagerPlugin.h"
#if __has_include(<vertical_card_pager/vertical_card_pager-Swift.h>)
#import <vertical_card_pager/vertical_card_pager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "vertical_card_pager-Swift.h"
#endif

@implementation VerticalCardPagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVerticalCardPagerPlugin registerWithRegistrar:registrar];
}
@end
