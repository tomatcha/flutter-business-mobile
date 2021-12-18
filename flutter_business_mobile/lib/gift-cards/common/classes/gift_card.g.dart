// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCard _$GiftCardFromJson(Map<String, dynamic> json) => GiftCard(
      vendor: json['vendor'] as String?,
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      image: json['image'] as String?,
      denominations: (json['denominations'] as List<dynamic>?)
          ?.map((e) => Denomination.fromJson(e))
          .toList(),
      position: json['position'] as int?,
      discount: (json['discount'] as num?)?.toDouble(),
      terms: json['terms'] as String?,
      importantContent: json['importantContent'] as String?,
      cardTypeStatus: json['cardTypeStatus'] as String?,
      customDenominations: json['customDenominations'] as List<dynamic>?,
      disclaimer: json['disclaimer'] as String?,
    );

Map<String, dynamic> _$GiftCardToJson(GiftCard instance) => <String, dynamic>{
      'vendor': instance.vendor,
      'id': instance.id,
      'brand': instance.brand,
      'image': instance.image,
      'denominations': instance.denominations,
      'position': instance.position,
      'discount': instance.discount,
      'terms': instance.terms,
      'importantContent': instance.importantContent,
      'cardTypeStatus': instance.cardTypeStatus,
      'customDenominations': instance.customDenominations,
      'disclaimer': instance.disclaimer,
    };
