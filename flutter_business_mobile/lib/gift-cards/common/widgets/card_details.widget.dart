import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
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
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.network(giftCard.image),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              Row(
                children: [Text(giftCard.brand)],
              ),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        // Take a copy of the current cart
                        final List<CartItem> cartItems = ref.read(cartProvider);
                        // Assign a new list to the stateProvider so that listeners are updated
                        ref.watch(cartProvider.notifier).state = [...cartItems, CartItem(giftCard: giftCard)];
                        // list.add(CartItem) won't notify listeners because the list is being modified, not overwritten
                      },
                      child: Text('Buy Now')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
