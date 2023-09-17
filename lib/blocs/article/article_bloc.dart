import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:whats_up_news/models/articles/article.dart';
import 'package:whats_up_news/services/articles_service.dart';

part 'article_event.dart';

part 'article_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleState()) {
    on<ArticleFetched>(
      _onArticleFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final ArticlesService service = ArticlesService();

  Future<void> _onArticleFetched(
    ArticleFetched event,
    Emitter<ArticleState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ArticleStatus.initial) {
        final articles = await service.getArticles();
        return emit(
          state.copyWith(
            status: ArticleStatus.success,
            articles: articles,
            hasReachedMax: false,
          ),
        );
      }

      final articles = await service.getArticles(
        page: state.articles.length ~/ 10,
      );
      articles.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ArticleStatus.success,
                articles: List.of(state.articles)..addAll(articles),
                hasReachedMax: false,
              ),
            );
    } on DioException catch (e) {
      final String errorMessage;
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive timeout';
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = 'Send timeout';
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = 'Request to API server was cancelled';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage = '404 server not found';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'No Internet';
      } else {
        errorMessage = 'Something went wrong';
      }

      emit(state.copyWith(status: ArticleStatus.failure, error: errorMessage));
    }
  }
}
