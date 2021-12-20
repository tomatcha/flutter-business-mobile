import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/gift_cards.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/shopping_cart.dart';
import 'package:flutter_business_mobile/text.constants.dart';
import 'package:flutter_business_mobile/widgets/cart_button.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Root extends StatelessWidget {
  final List<Widget> _screens = [
    GiftCards(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final int index = ref.watch(bottomNavProvider);
          return Scaffold(
            appBar: AppBar(
              title: Text(TextConstants.title),
              actions: [CartButton()],
            ),
            body: _screens[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.card_giftcard),
                  label: TextConstants.giftCards,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label: TextConstants.shoppingCard,
                ),
              ],
              onTap: (int index) {
                ref.read(bottomNavProvider.notifier).state = index;
              },
            ),
          );
        },
      ),
    );
  }
}
