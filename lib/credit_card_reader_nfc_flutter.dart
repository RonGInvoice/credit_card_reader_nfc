import 'dart:async';
import 'package:flutter/services.dart';
import 'models/card_model.dart';

class CreditCardReaderNfcFlutter {
  static const method_channel =
      const MethodChannel('credit_card_reader_nfc_flutter_channel');
  static const event_channel =
      const EventChannel('credit_card_reader_nfc_flutter_sink');

  Future<bool> available() async {
    return await method_channel.invokeMethod('available');
  }

  Future<bool> start() async {
    return await method_channel.invokeMethod('start');
  }

  Future<bool> stop() async {
    return await method_channel.invokeMethod('stop');
  }

  Future<CardModel?> read() async {
    return method_channel
        .invokeMapMethod<String, String?>('read')
        .then((value) => cardCB(value));
  }

  Stream<CardModel?> stream() {
    final sc = (e) => e == null ? null : cardCB(Map<String, String?>.from(e));

    return event_channel.receiveBroadcastStream().map(sc);
  }

  CardModel? cardCB(Map<String, String?>? event) {
    if (event == null) {
      return null;
    }

    return CardModel(
      number: event['number'],
      type: event['type'],
      holder: event['holder'],
      expire: event['expire'],
      cvv: event['cvv'],
      status: event['status'],
    );
  }
}
