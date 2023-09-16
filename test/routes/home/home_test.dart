import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:whats_up_news/routes/home/home.dart';

void main() {
  group('Home', () {
    testWidgets('Counter increments', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Find nav buttons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.widgetWithText(ElevatedButton, 'Search'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Articles'), findsOneWidget);
    });
  });
}
