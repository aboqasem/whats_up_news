import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whats_up_news/routes/router.gr.dart';
import 'package:whats_up_news/routes/search/search.dart';

import '../mocks.mocks.dart';

void main() {
  group('Search page', () {
    late Widget app;
    late MockStackRouter mockStackRouter;

    setUp(() {
      mockStackRouter = MockStackRouter();

      app = MaterialApp(
        home: StackRouterScope(
          controller: mockStackRouter,
          stateHash: 0,
          child: const SearchPage(),
        ),
      );
    });

    testWidgets('has title and buttons', (tester) async {
      await tester.pumpWidget(app).then((_) => tester.pumpAndSettle());

      expect(find.text('Search'), findsNWidgets(2));
      expect(find.widgetWithText(ElevatedButton, 'Articles'), findsOneWidget);
    });

    group('navigation', () {
      testWidgets('go to Articles page', (tester) async {
        await tester.pumpWidget(app).then((_) => tester.pumpAndSettle());

        when(mockStackRouter.push(const ArticlesRoute()))
            .thenAnswer((_) async => null);

        final articlesButton = find.widgetWithText(ElevatedButton, 'Articles');
        expect(articlesButton, findsOneWidget);

        await tester.tap(articlesButton);
        await tester.pumpAndSettle();

        verify(mockStackRouter.push(const ArticlesRoute())).called(1);
      });
    });
  });
}
