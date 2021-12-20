import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_business_mobile/text.constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import '../providers.dart';

class PurchaseConfirmation extends ConsumerWidget {
  List<CartItem> cartItems;
  double total;
  bool shouldClearCart = false;

  PurchaseConfirmation({required this.cartItems, required this.total, bool? shouldClearCart}) {
    if (shouldClearCart != null) {
      shouldClearCart = shouldClearCart;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width * 0.3;

    if (shouldClearCart) {
      // Clear the cart
      clearCart(ref); // TODO this isn't working properly
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 52.0, bottom: 52, left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TextConstants.purchaseSuccessful,
              style: const TextStyle(fontSize: 24),
            ),
            Expanded(
              child: ListView(
                children: cartItems.map((CartItem cartItem) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FadeInImage.memoryNetwork(
                              image: cartItem.giftCard.image,
                              placeholder: kTransparentImage,
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.giftCard.brand,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  cartItem.denomination.price.toString(),
                                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                                ),
                                SizedBox(
                                  width: 40,
                                  child: Text(
                                    ' x ${cartItem.quantity.toString()}',
                                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                                  ),
                                ),
                                Text(cartItem.calculateSubTotal().toStringAsFixed(2)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(children: [
              const Text('Total'),
              const Spacer(),
              Text('\$${total.toString()}'),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(TextConstants.dismiss),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
