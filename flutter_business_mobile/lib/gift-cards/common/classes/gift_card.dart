import 'denomination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_card.g.dart';

@JsonSerializable()
class GiftCard {
  GiftCard({
    String? vendor,
    String? id,
    String? brand,
    String? image,
    List<Denomination>? denominations,
    int? position,
    double? discount,
    String? terms,
    String? importantContent,
    String? cardTypeStatus,
    List<dynamic>? customDenominations,
    String? disclaimer,
  }) {
    _vendor = vendor;
    _id = id;
    _brand = brand;
    _image = image;
    _denominations = denominations;
    _position = position;
    _discount = discount;
    _terms = terms;
    _importantContent = importantContent;
    _cardTypeStatus = cardTypeStatus;
    _customDenominations = customDenominations;
    _disclaimer = disclaimer;
  }

  factory GiftCard.fromJson(dynamic json)=> _$GiftCardFromJson(json);

  String? _vendor;
  String? _id;
  String? _brand;
  String? _image;
  List<Denomination>? _denominations;
  int? _position;
  double? _discount;
  String? _terms;
  String? _importantContent;
  String? _cardTypeStatus;
  List<dynamic>? _customDenominations;
  String? _disclaimer;

  String? get vendor => _vendor;

  String? get id => _id;

  String? get brand => _brand;

  String? get image => _image;

  List<Denomination>? get denominations => _denominations;

  int? get position => _position;

  double? get discount => _discount;

  String? get terms => _terms;

  String? get importantContent => _importantContent;

  String? get cardTypeStatus => _cardTypeStatus;

  List<dynamic>? get customDenominations => _customDenominations;

  String? get disclaimer => _disclaimer;

  Map<String, dynamic> toJson() => _$GiftCardToJson(this);
}
