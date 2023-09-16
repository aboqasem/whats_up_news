import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whats_up_news/routes/articles/articles.dart';

void main() {
  group('Articles page', () {
    testWidgets('has title and button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ArticlesPage()));

      expect(find.text('Articles'), findsNWidgets(2));
    });
  });
}
