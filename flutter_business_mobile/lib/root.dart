import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/gift_cards.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_business_mobile/shopping-cart/shopping_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Root extends StatelessWidget {
  final List<Widget> _screens = [
    GiftCards(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final int index = ref.watch(screenProvider);
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Business Mobile')),
          body: _screens[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: 'Gift Cards',
              ),
              BottomNavigationBarItem(
                  icon: Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      final int length = ref.watch(cartProvider).length;
                      return Badge(
                        badgeContent: Text(length.toString(), style: const TextStyle(color: Colors.white)),
                        showBadge: length > 0,
                        elevation: 0,
                        shape: BadgeShape.circle,
                        child: const Icon(Icons.shopping_cart),
                      );
                    },
                  ),
                  label: 'Shopping Cart'),
            ],
            onTap: (int index) {
              ref.read(screenProvider.notifier).state = index;
            },
          ),
        );
      },
    );
  }
}
