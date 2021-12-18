import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartButton extends StatelessWidget {
  openCart(ref) {
    ref.read(bottomNavProvider.notifier).state = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final int length = ref.watch(cartProvider).length;
        return Badge(
          badgeContent: Text(
            length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          position: BadgePosition.topEnd(top: 0, end: 0),
          showBadge: length > 0,
          elevation: 0,
          shape: BadgeShape.circle,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              openCart(ref);
            },
          ),
        );
      },
    );
  }
}
