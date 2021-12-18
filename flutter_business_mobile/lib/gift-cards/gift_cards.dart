import 'package:flutter/material.dart';
import 'package:flutter_business_mobile/gift-cards/common/classes/gift_card.dart';
import 'package:flutter_business_mobile/gift-cards/common/widgets/gift_card.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'common/providers.dart';

class GiftCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final AsyncValue<List<GiftCard>> getGiftCards = ref.watch(giftCardProvider);
        return getGiftCards.when(
          data: (List<GiftCard> data) {
            return AnimationLimiter(
              child: ListView.builder(
                itemBuilder: (BuildContext listViewContext, int index) {
                  final GiftCard giftCard = data[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 250),
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: GiftCardWidget(giftCard: giftCard),
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              ),
            );
          },
          loading: () {
            return const SpinKitCircle(
              color: Colors.blue,
            );
          },
          error: (Object error, StackTrace? stackTrace) {
            return Text(error.toString());
          },
        );
      },
    );
  }
}
