import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';

class CartItem {
  GiftCard giftCard;
  int quantity = 1;

  CartItem({required this.giftCard, quantity}) {
    if (quantity != null) {
      this.quantity = quantity;
    }
  }
}
