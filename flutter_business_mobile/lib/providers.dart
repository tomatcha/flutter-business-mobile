import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'gift-cards/common/classes/gift_card.dart';

final StateProvider<List<GiftCard>> cartProvider = StateProvider((ref) {
  return [];
});

final StateProvider<int> screenProvider = StateProvider<int>((_) {
  return 0;
});
