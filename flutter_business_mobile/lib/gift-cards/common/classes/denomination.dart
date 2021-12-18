import 'package:json_annotation/json_annotation.dart';

part 'denomination.g.dart';

@JsonSerializable()
class Denomination {
  Denomination({
    double? price,
    String? currency,
    String? stock,
  }) {
    _price = price;
    _currency = currency;
    _stock = stock;
  }

  factory Denomination.fromJson(dynamic json) => _$DenominationFromJson(json);

  double? _price;
  String? _currency;
  String? _stock;

  double? get price => _price;

  String? get currency => _currency;

  String? get stock => _stock;

  Map<String, dynamic> toJson() => _$DenominationToJson(this);
}
