import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/card_details.widget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../text.constants.dart';

class GiftCardWidget extends StatelessWidget {
  final GiftCard giftCard;

  const GiftCardWidget({required this.giftCard});

  @override
  Widget build(BuildContext context) {
    const TextStyle sub = TextStyle(color: Colors.black38);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FadeInImage.memoryNetwork(
                image: giftCard.image,
                placeholder: kTransparentImage,
                width: 50,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(giftCard.brand, overflow: TextOverflow.ellipsis),
                  Text(TextConstants.discount + ': ' + giftCard.discount.toString(), style: sub),
                  Text(giftCard.vendor, style: sub),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CardDetails(giftCard: giftCard)));
                },
                child: Text(TextConstants.detail),
              ),
            )
          ],
        ),
      ),
    );
  }
}
