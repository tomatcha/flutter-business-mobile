import 'package:flutter_business_mobile/shopping-cart/common/classes/cart_item.class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<List<CartItem>> cartProvider = StateProvider((ref) {
  return [];
});

final StateProvider<int> bottomNavProvider = StateProvider<int>((_) {
  return 0;
});
