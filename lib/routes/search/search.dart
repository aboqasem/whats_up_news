import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:whats_up_news/routes/router.gr.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key, this.title = 'Search'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Search',
            ),
            ElevatedButton(
              onPressed: () {
                context.router.push(ArticlesRoute());
              },
              child: const Text('Articles'),
            ),
          ],
        ),
      ),
    );
  }
}
