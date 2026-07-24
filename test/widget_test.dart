import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gacad/main.dart';

void main() {
  testWidgets('Theme toggle switch test', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Verify the theme switch exists
    expect(find.byType(Switch), findsOneWidget);

    // Tap the switch to toggle theme
    await tester.tap(find.byType(Switch));
    await tester.pump();
  });
}