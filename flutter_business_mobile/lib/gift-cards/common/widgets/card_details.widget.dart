import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';

import '../../../text.constants.dart';

class CardDetails extends StatelessWidget {
  late GiftCard giftCard;

  CardDetails({required this.giftCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstants.details),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(giftCard.image),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
