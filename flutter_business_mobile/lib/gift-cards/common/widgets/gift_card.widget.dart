import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';

class GiftCardWidget extends StatelessWidget {
  final GiftCard giftCard;

  const GiftCardWidget({required this.giftCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [Text(giftCard.brand)],
        ),
      ),
    );
  }
}
