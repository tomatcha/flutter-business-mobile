import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/denomination.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
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
              Column(
                children: [ // TODO add listview here somewhere
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
                  Text(giftCard.terms),
                  ...giftCard.denominations.map((Denomination denomination) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                          children: [
                            Text(denomination.currency.toString()),
                            Text(denomination.price.toString()),
                            Text(denomination.stock.toString()),
                          ],
                        ),
                  )),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Show purchase confirmation
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PurchaseConfirmation(
                          cartItems: [CartItem(giftCard: giftCard)],
                        ),
                      ));
                    },
                    child: Text('Buy Now'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Take a copy of the current cart
                      final List<CartItem> cartItems = ref.read(cartProvider);
                      // Assign a new list to the stateProvider so that listeners are updated
                      ref.watch(cartProvider.notifier).state = [...cartItems, CartItem(giftCard: giftCard)];
                      // list.add(CartItem) won't notify listeners because the list is being modified, not overwritten
                    },
                    child: Text('Add to Cart'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
