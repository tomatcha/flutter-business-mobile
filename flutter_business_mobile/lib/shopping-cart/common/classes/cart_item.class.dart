import 'package:flutter_business_mobile/gift-cards/common/classes/denomination.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';

class CartItem {
  GiftCard giftCard;
  Denomination denomination;
  int quantity = 1;

  CartItem({required this.giftCard, quantity, required this.denomination}) {
    if (quantity != null) {
      this.quantity = quantity;
    }
  }

  double calculateSubTotal() {
    return denomination.price! * quantity;
  }
}
