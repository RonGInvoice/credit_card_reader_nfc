import Flutter
import UIKit

public class SwiftCreditCardReaderNfcFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "credit_card_reader_nfc_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftCreditCardReaderNfcFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
