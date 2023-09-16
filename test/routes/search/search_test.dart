import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whats_up_news/routes/search/search.dart';

void main() {
  group('Search', () {
    testWidgets('Find nav buttons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SearchPage()));

      expect(find.text('Search'), findsNWidgets(2));
      expect(find.widgetWithText(ElevatedButton, 'Articles'), findsOneWidget);
    });
  });
}
