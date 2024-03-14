import 'package:json_annotation/json_annotation.dart';

enum ActionType {
  @JsonValue('buy')
  buy,
  @JsonValue('sell')
  sell,
  @JsonValue('partner')
  partner,
}
