import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class ShoppingCart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartItem> cart = ref.watch(cartProvider);
    final double width = MediaQuery.of(context).size.width * 0.3;
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 9),
      padding: const EdgeInsets.all(7),
      minimumSize: Size.zero,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Text(
                'Cart',
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ...cart.map(
                (CartItem e) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FadeInImage.memoryNetwork(
                              image: e.giftCard.image,
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
                                  e.giftCard.brand,
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                '${e.denomination.currency} ${e.denomination.price.toString()}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Total: ${(e.denomination.price! * e.quantity).toString()}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Quantity: ${e.quantity.toString()}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                                TextButton(
                                  style: style,
                                  onPressed: () {
                                    // TODO Edit
                                  },
                                  child: const Text(
                                    'edit',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            style: style,
                            onPressed: () {
                              //TODO REmove item
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        // TODO subtotal
        ElevatedButton(
          onPressed: () {
            //show confirmation screen
          },
          child: const Text('Checkout'),
        )
      ],
    );
  }
}
