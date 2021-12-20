import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantitySelector extends StatelessWidget {
  AutoDisposeStateProvider<int> quantityProvider;

  QuantitySelector({required this.quantityProvider});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final int count = ref.watch(quantityProvider);
        return Row(
          children: [
            IconButton(
              iconSize: 15,
              onPressed: () {
                //Remove
                if (ref
                    .watch(quantityProvider.notifier)
                    .state > 1) {
                  ref
                      .watch(quantityProvider.notifier)
                      .state--;
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
                ref
                    .watch(quantityProvider.notifier)
                    .state++;
              },
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
