import 'package:credit_card_reader_nfc_flutter/credit_card_reader_nfc_flutter.dart';
import 'package:credit_card_reader_nfc_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final creditCardReaderNfcFlutter = CreditCardReaderNfcFlutter();
  CardModel? _card;

  @override
  void initState() {
    super.initState();

    final available = (bool status) {
      if (!status) {
        return;
      }
      creditCardReaderNfcFlutter
          .stream()
          .listen((card) => setState(() => _card = card));
    };

    final start = (_) {
      creditCardReaderNfcFlutter.available().then(available);
    };
    creditCardReaderNfcFlutter.start().then(start);
  }

  @override
  void dispose() {
    creditCardReaderNfcFlutter.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var result;
    if (_card == null) {
      result = Center(child: Text('waiting for nfc'));
    } else {
      final cardNumber = _card!.number!.substring(0, 1) +
          "*** **** ****" +
          _card!.number!.substring(_card!.number!.length - 1);
      final cardType = _card!.type;
      final holderName = _card!.holder;
      final expireDate = _card!.expire;
      final cardStatus = _card!.status;
      List<dynamic> preInfo = [
        'card number:',
        'card type:',
        'holder name:',
        'expire date:',
        'card status:'
      ];
      List<dynamic> info = [
        cardNumber,
        cardType,
        holderName ?? 'null',
        expireDate,
        cardStatus
      ];
      result = ListView.builder(
          itemCount: info.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(preInfo[index]),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      info[index],
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ],
            );
          });
    }

    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: result,
    )));
  }
}
