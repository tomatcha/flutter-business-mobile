// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'denomination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Denomination _$DenominationFromJson(Map<String, dynamic> json) => Denomination(
      price: double.parse(json['price'].toString()),
      currency: json['currency'] as String?,
      stock: json['stock'] as String?,
    );

Map<String, dynamic> _$DenominationToJson(Denomination instance) =>
    <String, dynamic>{
      'price': instance.price,
      'currency': instance.currency,
      'stock': instance.stock,
    };
