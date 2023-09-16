import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:whats_up_news/routes/home/home.dart';
import 'package:whats_up_news/routes/router.gr.dart';

import '../mocks.mocks.dart';

void main() {
  group('Home page', () {
    late Widget app;
    late MockStackRouter mockStackRouter;

    setUp(() {
      mockStackRouter = MockStackRouter();

      app = MaterialApp(
        home: StackRouterScope(
          controller: mockStackRouter,
          stateHash: 0,
          child: const HomePage(),
        ),
      );
    });

    testWidgets('counter increments', (WidgetTester tester) async {
      await tester.pumpWidget(app).then((_) => tester.pumpAndSettle());

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    group('navigation', () {
      testWidgets('go to Search page', (tester) async {
        await tester.pumpWidget(app).then((_) => tester.pumpAndSettle());

        final searchButton = find.widgetWithText(ElevatedButton, 'Search');
        expect(searchButton, findsOneWidget);

        when(mockStackRouter.push(SearchRoute())).thenAnswer((_) async => null);

        await tester.tap(searchButton);
        await tester.pumpAndSettle();

        verify(mockStackRouter.push(SearchRoute())).called(1);
      });

      testWidgets('go to Articles page', (tester) async {
        await tester.pumpWidget(app).then((_) => tester.pumpAndSettle());

        final articlesButton = find.widgetWithText(ElevatedButton, 'Articles');
        expect(articlesButton, findsOneWidget);

        when(mockStackRouter.push(ArticlesRoute()))
            .thenAnswer((_) async => null);

        await tester.tap(articlesButton);
        await tester.pumpAndSettle();

        verify(mockStackRouter.push(ArticlesRoute())).called(1);
      });
    });
  });
}
