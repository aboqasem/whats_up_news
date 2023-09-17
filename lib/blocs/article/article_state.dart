part of 'article_bloc.dart';

enum ArticleStatus { initial, success, failure }

final class ArticleState with EquatableMixin {
  const ArticleState({
    this.status = ArticleStatus.initial,
    this.articles = const <Article>[],
    this.hasReachedMax = false,
    this.error,
  });

  final ArticleStatus status;
  final List<Article> articles;
  final bool hasReachedMax;
  final String? error;

  ArticleState copyWith({
    ArticleStatus? status,
    List<Article>? articles,
    bool? hasReachedMax,
    String? error,
  }) {
    return ArticleState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }

  @override
  List<Object> get props => [status, articles, hasReachedMax];
}
