import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<List<CartItem>> cartProvider = StateProvider((ref) {
  return [];
});

updateCart(WidgetRef ref, CartItem? cartItem) {
  // Take a copy of the current cart
  List<CartItem> cartItems = ref.read(cartProvider);

  // Check for any items marked for removal
  cartItems = cartItems.where((element) => element.remove == false).toList();

  if (cartItem != null) {
    cartItems.add(cartItem);
  }
  // Assign a new list to the stateProvider so that listeners are updated
  ref.watch(cartProvider.notifier).state = [
    ...cartItems,
  ];
}

final StateProvider<int> bottomNavProvider = StateProvider<int>((_) {
  return 0;
});
