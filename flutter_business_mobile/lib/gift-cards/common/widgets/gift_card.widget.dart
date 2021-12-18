import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';

class GiftCardWidget extends StatelessWidget {
  final GiftCard giftCard;

  const GiftCardWidget({required this.giftCard});

  @override
  Widget build(BuildContext context) {
    return Text(giftCard.brand ?? '');
  }
}
