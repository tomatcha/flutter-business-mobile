import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/denomination.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/common/providers.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/denomination.widget.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/quantity_selector.widget.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_business_mobile/widgets/cart_button.widget.dart';
import 'package:flutter_business_mobile/widgets/purchase_confirmation.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../text.constants.dart';

class CardDetails extends ConsumerWidget {
  late GiftCard giftCard;

  CardDetails({required this.giftCard});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstants.details),
        actions: [CartButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.network(giftCard.image),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Text('Brand: ${giftCard.brand}'), // TODO make this presentable
                    ]),
                  ),
                  Text('Discount: ${giftCard.discount.toString()}'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...giftCard.denominations.map((Denomination denomination) {
                    return DenominationWidget(giftCard: giftCard, denomination: denomination);
                  }),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(TextConstants.terms, style: const TextStyle(fontSize: 12)),
              children: [
                Text(
                  giftCard.terms,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
