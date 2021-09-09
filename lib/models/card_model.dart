import 'package:flutter/foundation.dart';

@immutable
class CardModel {
  final String? number;

  final String? expire;

  final String? holder;

  final String? type;

  final String? status;

  const CardModel(
      {this.number, this.expire,this.holder, this.type, this.status});
}
