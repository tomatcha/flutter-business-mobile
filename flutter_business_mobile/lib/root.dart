import 'package:flutter/material.dart';
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
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Flutter Business Mobile'),
          ),
          body: _screens[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Gift Cards'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
            ],
            onTap: (index) {
              ref.read(screenProvider.notifier).state = index;
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
