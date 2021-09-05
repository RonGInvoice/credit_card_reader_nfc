#import "CreditCardReaderNfcFlutterPlugin.h"
#if __has_include(<credit_card_reader_nfc_flutter/credit_card_reader_nfc_flutter-Swift.h>)
#import <credit_card_reader_nfc_flutter/credit_card_reader_nfc_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "credit_card_reader_nfc_flutter-Swift.h"
#endif

@implementation CreditCardReaderNfcFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCreditCardReaderNfcFlutterPlugin registerWithRegistrar:registrar];
}
@end
