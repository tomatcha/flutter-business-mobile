import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/denomination.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/quantity_selector.widget.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_business_mobile/widgets/purchase_confirmation.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';
import '../../../text.constants.dart';

class DenominationWidget extends ConsumerWidget {
  Denomination denomination;
  GiftCard giftCard;

  DenominationWidget({required this.denomination, required this.giftCard});

  @override
  Widget build(BuildContext context, ref) {
    // Declare quantityProvider here so each denomination has it's own instance
    // TODO there is probably definitely a better way to achieve this
    final AutoDisposeStateProvider<int> quantityProvider = StateProvider.autoDispose((ref) {
      return 1;
    });

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 9),
      padding: const EdgeInsets.all(7),
      minimumSize: Size.zero,
    );
    final bool isInStock = denomination.stock == 'IN_STOCK'; // TODO constant
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 0),
      child: Row(
        children: [
          isInStock
              ? ElevatedButton(
                  style: style,
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
                )
              : const Spacer(flex: 2), // TODO this needs to be better
          const Spacer(flex: 1),
          Text(
            '${denomination.price.toString()} ${denomination.currency.toString()}',
            style: isInStock ? null : const TextStyle(color: Colors.grey),
          ),
          const Spacer(flex: 3),
          ...(isInStock
              ? [
                  QuantitySelector(quantityProvider: quantityProvider),
                  ElevatedButton(
                    style: style,
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
                  )
                ]
              : [const Text('Out of stock')]),
        ],
      ),
    );
  }
}
