import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import 'classes/gift_card.dart';

final AutoDisposeFutureProvider<List<GiftCard>> giftCardProvider = FutureProvider.autoDispose((ref) async {
  final Response response = await get(Uri.parse('http://zip.co/giftcards/api/giftcards'));
  if (response.statusCode == 200) {
    final dynamic decoded = jsonDecode(response.body);
    try {
      final List<dynamic> data = decoded as List<dynamic>;
      return data.map((dynamic v) => GiftCard.fromJson(v as Map<String, dynamic>)).toList();
      // return [];
    } catch (err, stack) {
      print('💥💥 ${err.toString()}');
      print(stack);
      throw Exception('Error parsing list of gift cards');
    }
  } else {
    print('Error retrieving gift cards.');
    throw Exception('Error retrieving gift cards.');
  }
});
