part of 'article_bloc.dart';

sealed class ArticleEvent with EquatableMixin {}

final class ArticleFetched extends ArticleEvent {
  @override
  List<Object?> get props => [];
}
