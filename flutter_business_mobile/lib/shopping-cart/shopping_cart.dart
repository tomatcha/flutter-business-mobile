import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/quantity_selector.widget.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_business_mobile/widgets/purchase_confirmation.widget.dart';
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

    double total = 0;
    for (var element in cart) {
      total = total + element.calculateSubTotal();
    }
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
              cart.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Text('No items'),
                    )
                  : Container(),
              ...cart.map(
                (CartItem cartItem) {
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
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                '${cartItem.denomination.currency} ${cartItem.denomination.price.toString()}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Subtotal: ${cartItem.calculateSubTotal().toStringAsFixed(2)}',
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
                                  'Quantity: ${cartItem.quantity.toString()}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                                TextButton(
                                  style: style,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        final AutoDisposeStateProvider<int> quantityProvider = StateProvider.autoDispose((ref) {
                                          return cartItem.quantity;
                                        });
                                        return AlertDialog(
                                          content: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text('Update Quantity'),
                                              QuantitySelector(quantityProvider: quantityProvider),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                cartItem.quantity = ref.read(quantityProvider);
                                                updateCart(ref, null);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        );
                                      },
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            style: style,
                            onPressed: () {
                              // Remove item
                              cartItem.remove = true;
                              updateCart(ref, null);
                            },
                            child: const Text('Remove', style: TextStyle(fontSize: 10)),
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
        Row(
          children: [
            const Spacer(),
            Text('Total: $total'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                //show confirmation screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      final List<CartItem> cartItems = ref.read(cartProvider);
                      return PurchaseConfirmation(cartItems: cartItems, total: total, shouldClearCart: true);
                    },
                  ),
                );
              },
              child: const Text('Checkout'),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
