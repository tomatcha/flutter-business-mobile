import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_business_mobile/main.dart';

void main() {
  testWidgets('Test Main Screens', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp())); // TODO HTTP requests don't work in tests

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pump();

    expect(find.text('Gift Cards'), findsOneWidget);
    expect(find.text('Shopping Cart'), findsOneWidget);
    expect(find.text('Flutter Business Mobile'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart).last);
    await tester.pump();

    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('No items'), findsOneWidget);
    expect(find.text('Total: 0.0'), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);

    // TODO the below tester.tap does not work
    // await tester.ensureVisible(find.byType(ElevatedButton));
    // await tester.tap(find.text('Checkout'));
    // await tester.pump(Duration(milliseconds: 3000));
    // await tester.ensureVisible(find.text('Purchase Successful'));
    //
    // expect(find.text('Purchase Successful'), findsOneWidget);
    // expect(find.text('Total'), findsOneWidget);
    // expect(find.text('\$0.0'), findsOneWidget);
    // expect(find.text('Dismiss'), findsOneWidget);
    //
    // await tester.tap(find.text('Dismiss'));
    // await tester.pump(Duration(milliseconds: 3000));
    // // Verify that we're back at the previous screen
    // expect(find.text('Cart'), findsOneWidget);
    // expect(find.text('No items'), findsOneWidget);
    // expect(find.text('Total: 0.0'), findsOneWidget);
    // expect(find.text('Checkout'), findsOneWidget);
  });
}
