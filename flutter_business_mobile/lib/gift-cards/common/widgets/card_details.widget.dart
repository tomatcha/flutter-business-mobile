import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/denomination.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/common/providers.dart';
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      Text(giftCard.brand), // TODO make this presentable
                      const Spacer(flex: 1),
                      Text(giftCard.discount.toString()),
                      const Spacer(flex: 2),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Show purchase confirmation
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                final int quantity = ref.watch(quantityProvider.notifier).state;
                                return PurchaseConfirmation(
                                  cartItems: [CartItem(giftCard: giftCard, quantity: quantity)],
                                );
                              },
                            ),
                          );
                        },
                        child: Text(TextConstants.buyNow),
                      ),
                      const Spacer(),
                      Consumer(
                        // Quantity selector
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          final int count = ref.watch(quantityProvider);
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  //Remove
                                  if (ref.watch(quantityProvider.notifier).state > 1) {
                                    ref.watch(quantityProvider.notifier).state--;
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(count.toString()),
                              IconButton(
                                onPressed: () {
                                  //Add
                                  ref.watch(quantityProvider.notifier).state++;
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          );
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Take a copy of the current cart
                          final List<CartItem> cartItems = ref.read(cartProvider);
                          // Get the quantity
                          final int quantity = ref.watch(quantityProvider.notifier).state;
                          // Assign a new list to the stateProvider so that listeners are updated
                          ref.watch(cartProvider.notifier).state = [...cartItems, CartItem(giftCard: giftCard, quantity: quantity)];
                          // list.add(CartItem) won't notify listeners because the list is being modified, not overwritten
                        },
                        child: Text(TextConstants.addToCart),
                      ),
                    ],
                  ),
                  Text(giftCard.terms),
                  ...giftCard.denominations.map(
                    (Denomination denomination) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(denomination.currency.toString()), // TODO
                          Text(denomination.price.toString()),
                          Text(denomination.stock.toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
