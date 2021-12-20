import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      // Quantity selector
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final int count = ref.watch(quantityProvider);
        return Row(
          children: [
            IconButton(
              iconSize: 15,
              onPressed: () {
                //Remove
                if (ref.watch(quantityProvider.notifier).state > 1) {
                  ref.watch(quantityProvider.notifier).state--;
                }
              },
              icon: const Icon(Icons.remove),
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 11),
            ),
            IconButton(
              iconSize: 15,
              onPressed: () {
                //Add
                ref.watch(quantityProvider.notifier).state++;
              },
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
