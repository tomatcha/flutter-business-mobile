import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'common/providers.dart';

class GiftCards extends StatelessWidget {
  const GiftCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final thing = ref.watch(giftCardProvider);
        return thing.when(
          data: (List<GiftCard> data) {
            return Text('Got some cards ${data.length}');
          },
          loading: () {
            return SpinKitCircle();
          },
          error: (Object error, StackTrace? stackTrace) {
            return Text(error.toString());
          },
        );
      },
    );
  }
}
