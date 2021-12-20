import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_business_mobile/text.constants.dart';

class PurchaseConfirmation extends StatelessWidget {
  List<CartItem> cartItems;

  PurchaseConfirmation({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(52.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Text(TextConstants.purchaseSuccessful),
            Text(cartItems.length.toString()), // TODO
            const Spacer(flex: 2),
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
