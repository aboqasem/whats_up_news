import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whats_up_news/blocs/article/article_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_up_news/models/articles/article.dart';

@RoutePage()
class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  final String title = 'Articles';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocProvider(
        create: (_) => ArticleBloc()..add(ArticleFetched()),
        child: const ArticlesList(),
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        switch (state.status) {
          case ArticleStatus.failure:
            return Center(
              child: Text(state.error ?? 'Failed to fetch articles'),
            );
          case ArticleStatus.success:
            if (state.articles.isEmpty) {
              return const Center(child: Text('no articles'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.articles.length
                    ? const BottomLoader()
                    : ArticleListItem(article: state.articles[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.articles.length
                  : state.articles.length + 1,
              controller: _scrollController,
            );
          case ArticleStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ArticleBloc>().add(ArticleFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(article.pubDate.toLocal().toString()),
        dense: true,
        onTap: () async => await launchUrl(Uri.parse(article.url)),
      ),
    );
  }
}
